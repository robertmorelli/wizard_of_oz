#!/usr/bin/env bash
# The careful native run: every Benchmarks Game program × language × size level, speed level vs
# that level, PAIRS interleaved process pairs (order flips each pair). Each process is the timing
# driver (setup untimed, warmups, then SAMPLES timed bench calls) and reports its median.
# Prints: program lang level pair median_ms
# usage: native/accurate-native.sh PAIRS [pin...]
set -euo pipefail
cd "$(dirname "$0")"
pairs=$1; shift
declare -A SPEED=([c]=O3 [cpp]=O3 [rust]=3 [swift]=O)
declare -A SIZE=([c]="Os Oz" [cpp]="Os Oz" [rust]="s z" [swift]=Osize)
for dir in ../programs/*/; do prog=$(basename $dir); [ -f $dir/program.json ] || continue
  read n setup < <(python3 -c "import json;c=json.load(open('$dir/program.json'));s=c.get('setup');print(c['n'], c['n'] if s is True else (s if isinstance(s,int) and not isinstance(s,bool) else ''))")
  for key in c cpp rust swift; do sp=build/$prog/$key-${SPEED[$key]}/bench; [ -x $sp ] || continue
    for lv in ${SIZE[$key]}; do sz=build/$prog/$key-$lv/bench; [ -x $sz ] || continue
      for i in $(seq $pairs); do order="${SPEED[$key]} $lv"; [ $((i % 2)) = 0 ] && order="$lv ${SPEED[$key]}"
        for l in $order; do
          m=$("$@" build/$prog/$key-$l/bench $n 5 2 $setup | python3 -c "import sys,json;print([json.loads(x[7:])['median'] for x in sys.stdin if x.startswith('RESULT ')][0])")
          echo "$prog $key $l $i $m"
        done
      done
    done
  done
done
