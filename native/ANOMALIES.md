# Why small builds won (Nov 8, 2026, Mac arm64, Apple clang)

Wins from `native/accurate-arm64.txt` (small ÷ O3, 95% interval below 1). Experiment sources are
in `native/anomalies/` (see its README); binaries are not kept.

## knucleotide C++ Os 0.70: O3 inliner misses the hash lookup by exactly 0

Per-phase totals (ms, 7 calls): k=1 23.4 vs 23.8; k=2/3/4/6 49 vs 18.7; k=12/18 204/217 vs 166/180.

- `-Rpass-missed=inline` at O3: `cc_ht_map::subscript_imp` "too costly to inline (cost=325, threshold=325)".
  O3 first inlines the resize policy's `get_new_size` into `subscript_imp`, which pushes it to 325.
  At Os `get_new_size` stays out of line (cost 95 > threshold 50), `subscript_imp` costs 235 and is inlined.
- k=2..6: O3 inlines the lookup inside the loop but not the first `++table[key]` before it; that call
  takes `&key`, so `key` lives on the stack and every byte does `ldr/str [sp,#0xc]` (a loop-carried
  store→load). Copying the key for the first insert (`{ Key<size> k0 = key; ++table[k0]; }`) makes O3 18.7.
- k=12/18: O3 calls `subscript_imp` out of line on every element (key via memory again); Os inlines it.
- O3 with `-mllvm -inline-threshold=1000`: 65.0 ms vs Os 66.7, O3 95. Same checksum.

## binarytrees C++ Oz 0.89: O3's `make` pays a full frame on every leaf

- Phases (ms, 7 calls): make 1820 (O3) vs 1550 (Oz); check 487 vs 505; pool free ~1 both.
  (Os loses because its `~object_pool` keeps the O(n) cleanup loop: 477 ms.)
- Not code alignment, outlining, vectorization, unrolling, pool block setup (`segregate`,
  `ordered_malloc_need_resize` kept out of line at O3: no change), page faults (same), or which
  backend runs: Oz's IR through the O3 backend is fast (297), O3's IR through the Oz backend slow (328).
- Splitting the program into three files and mixing levels: only the level of `make` matters.
- CPU Counters (Instruments): O3 53.6% instruction-processing bottleneck, 34.1% useful;
  Oz 16.6% and 52.9%. Oz runs more instructions but stalls less.
- O3 `make` saves 3 register pairs before testing `d==0`, so every leaf call (half of all calls)
  does 3 stp + 3 ldp. Oz saves 2 and tail-calls `construct`. O3 with the non-leaf body moved to a
  noinline `make_inner` (leaves then built inline, no call): 302 ms vs O3 332, Oz 297.

## fannkuchredux C Oz 0.95: where the count update lands relative to the flip loop

- The flip loops are identical instruction for instruction at O3 and Oz; loop alignment
  (`-falign-loops=16/32/64`) changes nothing.
- O3 sinks the first permutation's `count_vec` update (dup/cmhi/cmeq/and/sub) below the second
  flip loop, so after that loop's hard-to-predict exit the next `i` (addv/fmov/rbit/clz), the
  `masks_shift` load and the shuffle wait on it. Oz keeps it before the flip loop.
- An empty `__asm__ volatile("" : "+w"(count_vec))` after the update pins it: O3 96.0 -> 73.4 ms,
  Oz 91.1 -> 73.2 ms, same checksum. Both levels schedule it badly; Oz less so.

## spectralnorm Swift Os 0.93: `/2` as two shifted adds vs one sdiv, in a loop at the issue limit

- The inner loops differ in one place: `(i+j)*(i+j+1)/2`. -O lowers it to `add x,x,x,lsr #63` +
  `adds x,y,x,asr #1` (two shifted-operand ALU ops); -Osize keeps `sdiv x,x,#2-in-a-register`.
- CPU Counters: -O 81.8% useful / 17.6% processing-bound; -Osize 88.2% / 11.3%. Both near the
  issue limit, so the instruction mix decides.
- Forcing a real divide at -O (divisor from a noinline function): 163.6 -> 154.9 ms (Osize 151.4).
  The loop is fragile both ways: writing `>> 1` by hand makes -Osize 194 ms, an opaque divisor
  makes it 180. Same checksum in every variant.
