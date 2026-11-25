#!/usr/bin/env bash
# Bobby's Zig JPL compiler at every Zig build mode, timed with hyperfine on t3.jpl.
# usage: compilers/hyperfine-zig.sh [pin-cmd...]   e.g. taskset -c 3
set -euo pipefail
cd "$(dirname "$0")"
plat=$( [ "$(uname)" = Linux ] && echo x86 || echo arm64 )
out=hyperfine-$plat; mkdir -p build/hf "$out"
for m in ReleaseFast ReleaseSmall ReleaseSafe Debug; do
  zig build-exe src/bobby/src/jpl_bench.zig -O$m -femit-bin=build/hf/jpl-$m >/dev/null
done
for mode in l p t; do
  cmds=(); for m in ReleaseFast ReleaseSmall ReleaseSafe Debug; do cmds+=(-n "$m" "$* build/hf/jpl-$m t3.jpl -$mode > /dev/null"); done
  hyperfine --warmup 3 --runs 20 --export-json "$out/$mode.json" "${cmds[@]}" 2>&1 | grep -E "Benchmark|Time|±" || true
done
