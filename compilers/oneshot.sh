#!/usr/bin/env bash
# One-shot cold runs without hyperfine: drop the file cache, then time one direct launch
# with timeit (clock around fork/exec/wait only).
#   oneshot.sh smoke PAIRS          Edward parse, O3 vs Os alternating
#   oneshot.sh sweep TAG [pin...]   every build × job once, shuffled -> oneshot-<plat>.<TAG>.tsv
set -euo pipefail
cd "$(dirname "$0")"
if [ "$(uname)" = Linux ]; then plat=x86; drop() { sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null; }
else plat=arm64; drop() { sync; sudo -n /usr/sbin/purge; }; fi
cc -O2 -o build/timeit timeit.c
declare -A BIN=([bobby]=jpl-bench [edward]=myjplc [stefan]=rjplc [henry]=jpl-rs)
mode=$1; shift
if [ $mode = smoke ]; then
  for i in $(seq $1); do order="O3 Os"; [ $((i % 2)) = 0 ] && order="Os O3"
    for lv in $order; do drop; echo "$lv $(build/timeit ${PIN:-} build/edward-$lv/myjplc t3.jpl -p)"; done; done
  exit
fi
tag=$1; shift
jobs=(); for who in bobby edward stefan henry; do for lv in O3 Os Oz; do [ -x build/$who-$lv/${BIN[$who]} ] || continue; for m in l p t; do jobs+=("$who $lv $m"); done; done; done
out=oneshot-$plat.$tag.tsv; echo -e "who\tlevel\tjob\tms" > $out
printf '%s\n' "${jobs[@]}" | (command -v shuf >/dev/null && shuf || sort -R) | while read who lv m; do
  drop; echo -e "$who\t$lv\t$m\t$(build/timeit "$@" build/$who-$lv/${BIN[$who]} t3.jpl -$m)" >> $out
done
