#!/usr/bin/env bash
# The careful run: every compiler × size level × job, O3 vs that level, PAIRS interleaved pairs
# (order flips each pair), timed directly with timeit, warm and cold (file cache dropped before
# every run). Prints: cond who job level pair wall user sys minflt majflt rss
# usage: accurate.sh PAIRS [pin...]
set -euo pipefail
cd "$(dirname "$0")"
if [ "$(uname)" = Linux ]; then drop() { sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null; }
else drop() { sync; sudo -n /usr/sbin/purge; }; fi
declare -A BIN=([bobby]=jpl-bench [edward]=myjplc [stefan]=rjplc [henry]=jpl-rs)
[ build/timeit -nt timeit.c ] || cc -O2 -o build/timeit timeit.c
n=$1; shift
for cond in warm cold; do for who in bobby edward stefan henry; do for job in l p t; do for lv in Os Oz; do
  [ -x build/$who-$lv/${BIN[$who]} ] || continue
  [ $cond = warm ] && { build/timeit "$@" build/$who-O3/${BIN[$who]} t3.jpl -$job >/dev/null; build/timeit "$@" build/$who-$lv/${BIN[$who]} t3.jpl -$job >/dev/null; }
  for i in $(seq $n); do order="O3 $lv"; [ $((i % 2)) = 0 ] && order="$lv O3"
    for l in $order; do [ $cond = cold ] && drop; echo "$cond $who $job $lv $i $l $(build/timeit "$@" build/$who-$l/${BIN[$who]} t3.jpl -$job)"; done
  done
done; done; done; done
