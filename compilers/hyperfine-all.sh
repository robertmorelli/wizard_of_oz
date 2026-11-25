#!/usr/bin/env bash
# All four JPL compilers at each level (binaries from run-compilers.mjs, in build/<who>-<level>/),
# timed with hyperfine: 3 warmups, 20 runs, output to /dev/null.
# usage: compilers/hyperfine-all.sh [pin-cmd...]   e.g. taskset -c 3
set -euo pipefail
cd "$(dirname "$0")"
plat=$( [ "$(uname)" = Linux ] && echo x86 || echo arm64 )
out=hyperfine-all-$plat; mkdir -p "$out"
declare -A BIN=([bobby]=jpl-bench [edward]=myjplc [stefan]=rjplc [henry]=jpl-rs)
for who in bobby edward stefan henry; do
  for mode in l p t; do
    cmds=()
    for lv in O3 Os Oz; do
      exe=build/$who-$lv/${BIN[$who]}
      [ -x "$exe" ] && cmds+=(-n "$lv" "$* $exe t3.jpl -$mode > /dev/null")
    done
    echo "== $who -$mode"
    hyperfine --warmup 3 --runs 20 --export-json "$out/$who-$mode.json" "${cmds[@]}" 2>&1 | grep -E "Benchmark|Time \(" || true
  done
done
