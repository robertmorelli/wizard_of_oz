# Why do Os/Oz builds sometimes win a single cold run?

The JPL compilers (compilers/src) at O3 / Os / Oz, timed on t3.jpl (12 MB).

## What repeated runs say
- Warm, hyperfine 3 warmups + 20 runs: O3 is fastest in every case, both machines.
- Cold, hyperfine 10 runs each with the file cache dropped first (coldstart-rep.sh): O3 is
  fastest except two ties inside noise (Henry Mac lex Os 0.98, Edward x86 typecheck Os 0.97).
- Cold with a different compiler run on the same core before each run, to wipe branch
  predictors and caches (coldscrub.sh): no change, except Stefan x86 typecheck Os 1.03 -> 0.96.

## What single cold runs say
coldstart.sh: one run of every build × job, shuffled, file cache dropped first. Four sweeps
(coldstart-<plat>.run1..4.tsv). Os or Oz beat O3 in 17 cases at least once. Most
often: Edward parse x86 Os (3/4), Edward parse x86 Oz (3/4), Edward typecheck x86 Os (3/4),
Stefan typecheck x86 Os (3/4), Bobby lex Mac Oz (2/4).

coldstart.sh timed one run through hyperfine in shell mode, which first times empty shell
launches and subtracts them. oneshot.sh times one direct launch instead (timeit.c: a clock
around fork/exec/wait only).

## Finding 1: x86 (WSL2) has a bimodal kernel slow mode
Edward x86 parse, O3 vs Os, 10 alternating cold pairs with oneshot.sh: Os won 5/10.
Every run is either fast (815-877 ms) or slow (977-1127 ms), for both builds.
- Same page-fault count every run (158,760 minor, 23 major); no transparent huge pages
  (THP is madvise-only; thp_fault_alloc stays 0).
- The extra ~200 ms is all kernel (system) time: 0.39-0.48 s fast, 0.59-0.69 s slow.
- It comes roughly every other run.
- Touching 1.5 GB of memory right before each run does not remove it, so it is not Windows
  reclaiming the VM's freed memory.
- The Mac has no slow mode: 12 cold runs of the same case, 0.32-0.35 s.

So on x86 a single cold run's winner is whichever build drew the fast mode; it is not
about the build. Not yet known: what the kernel is doing in the slow mode (open: does it
persist without the cache drop, without taskset, and does it follow which physical memory
the run gets).

## Finding 2: Bobby lex Mac Oz was hyperfine, not the build
One-shot wins were 0.78, 0.89, then 1.02, 1.02 (hyperfine-timed).
- Timed directly (timeit, cache purged before each run), 20 alternating O3/Oz pairs:
  O3 64-67 ms, Oz 64-68 ms, median 66.1 vs 65.8, Oz won 9/20. No effect.
- On the M1 Pro a cold start barely costs anything: cold lex 63-76 ms vs warm 64 ms;
  reading the 12 MB t3.jpl cold takes 9.8 ms vs 4.1 ms warm.
- hyperfine -N with a purge prepare reports the same runs as 117-130 ms (both builds):
  about +55 ms of its own, with jitter. coldstart.sh's 0.78 was O3 182 ms vs Oz 143 ms,
  both inside that inflated, jittery range. So hyperfine's cold numbers on the Mac
  (coldstart.sh, coldstart-rep.sh, coldscrub.sh) carry this overhead; use oneshot.sh.
- Separately, idling 6-10 s after the purge makes every run ~12% slower (74 vs 66 ms),
  likely the CPU clocking down; it hits every build alike.

## Finding 3: every case, timed directly
pairs.sh: 20 alternating cold pairs per case, timed with timeit (wall, user, sys, faults).
- Mac: no case wins. Bobby lex Oz 1.001 (10/20 pairs), Henry lex Os 1.001 (7/20); the other
  five 1.03-1.10 (0-1/20).
- x86: Bobby lex Oz 0.99 (14/20), Edward typecheck Os 0.98 (9/20), Stefan typecheck Os 1.01
  (10/20), Edward parse Os/Oz 1.09/1.15 (8-9/20), others 1.02-1.04 (1-6/20). The cases near
  half are the ones with wide two-mode ranges (Edward parse O3 813-1058 ms).

## Finding 4: the Mac's hyperfine overhead is a fixed launch cost after purge
hyperfine -N timing /usr/bin/true right after purge: 35-42 ms (warm: 1.3 ms). The first process
launched after a purge pays ~40 ms whatever it is. hyperfine is already running when it starts
its clock, so that cost and its jitter land in every cold sample; timeit is launched fresh after
the purge and pays it before its clock starts. The cost does not depend on the binary's size.

## Finding 5: the x86 slow mode is freed memory going cold under WSL2
A plain C program that touches 600 MB (Edward's parse touches about that much):
- back to back: mostly ~310 ms, an occasional ~460-530 ms
- 5 s after the previous run, with or without a cache drop: always ~540 ms
- 5 s with core 3 spinning the whole time: still ~540 ms, so it is not the CPU idling
  (a pure CPU loop is 243 ms whether or not it idled first)
- 5 s, but another process touched memory just before: back to ~310 ms
So memory that sits free for a few seconds becomes ~75% slower to fault back in: consistent with
WSL2 handing free guest memory back to Windows (page reporting), so the next faults go to the
hypervisor. A run's speed depends on how long its memory sat free, not on the build.

Follow-up:
- pageReporting=false and autoMemoryReclaim=disabled in .wslconfig (then wsl --shutdown) did not
  change it: still ~310 ms back to back, ~520-580 ms after 5 s idle.
- Memory a process keeps mapped does not go cold (re-touching 600 MB after 5 s idle: 2-3 ms).
  Only fresh page faults on freed memory are slow.
- dmesg: "hv_balloon: Cold memory discard hint enabled with order 9". The guest reports freed
  blocks to Hyper-V (free page reporting, built into the kernel: CONFIG_PAGE_REPORTING=y,
  CONFIG_HYPERV_BALLOON=y), and Hyper-V discards their backing; the next fault on them goes to the
  hypervisor. /sys/module/page_reporting/parameters/page_reporting_order was 5 (report freed
  blocks from 128 KB up).
- Raising page_reporting_order to 10 (only 4 MB blocks reported) cut the idle penalty from
  ~490-550 ms to ~450-490 ms; back at 9 it returned. The driver cannot be unloaded from the guest.
  (Order restored to 5.)
Conclusion: on WSL2 a run is slow when the memory it faults in was freed long enough ago for
Hyper-V to discard it. One-shot runs, with gaps between them, hit this at random, which is what
gave Os/Oz their x86 one-shot wins. It also fits the earlier warm x86 oddities: hyperfine-zig's
ReleaseFast lex (96 ms vs ReleaseSmall 91 ms) had more system time (43.4 vs 40.6 ms) and less
user time (53.9 vs 57.0 ms) than ReleaseSmall.
