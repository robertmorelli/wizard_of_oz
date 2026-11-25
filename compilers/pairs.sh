#!/usr/bin/env bash
# Direct-timed cold pairs: pairs.sh WHO JOB LEVEL N [pin...]
# N alternating pairs of O3 vs LEVEL; the file cache is dropped before every run.
# Prints: pair level wall user sys minflt majflt rss
set -euo pipefail
cd "$(dirname "$0")"
if [ "$(uname)" = Linux ]; then drop() { sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null; }
else drop() { sync; sudo -n /usr/sbin/purge; }; fi
declare -A BIN=([bobby]=jpl-bench [edward]=myjplc [stefan]=rjplc [henry]=jpl-rs)
who=$1 job=$2 lv=$3 n=$4; shift 4
[ build/timeit -nt timeit.c ] || cc -O2 -o build/timeit timeit.c
for i in $(seq $n); do order="O3 $lv"; [ $((i % 2)) = 0 ] && order="$lv O3"
  for l in $order; do drop; echo "$i $l $(build/timeit "$@" build/$who-$l/${BIN[$who]} t3.jpl -$job)"; done
done
