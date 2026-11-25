#!/usr/bin/env bash
# Ablation on one case (Edward, x86, parse): O3 vs Os one-shot cold runs, alternating order,
# PAIRS pairs per condition. Prints condition, level, ms.
#   exact   as coldstart.sh: hyperfine through a shell, --runs 1, prepare drop, python between
#   noshell same, hyperfine -N (prepare as a script)
#   idle5   exact, plus sleep 5 before each run
#   back    exact, but no python/idle between (next hyperfine starts at once)
set -euo pipefail
cd "$(dirname "$0")"
pairs=${1:-10}; pin="taskset -c 3"
drop='sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null'
printf '#!/bin/sh\n%s\n' "$drop" > /tmp/drop.sh; chmod +x /tmp/drop.sh
one() { # cond lv
  local exe=build/edward-$2/myjplc
  case $1 in
    noshell) hyperfine -N --runs 1 --prepare /tmp/drop.sh --export-json /tmp/s.json "$pin $exe t3.jpl -p" >/dev/null 2>&1 ;;
    *) hyperfine --runs 1 --prepare "$drop" --export-json /tmp/s.json "$pin $exe t3.jpl -p > /dev/null" >/dev/null 2>&1 ;;
  esac
  if [ $1 = back ]; then grep -o '"times": *\[[0-9.e-]*' /tmp/s.json | grep -o '[0-9.e-]*$'
  else python3 -c "import json;print(json.load(open('/tmp/s.json'))['results'][0]['times'][0])"; fi
}
for cond in exact noshell idle5 back; do
  for i in $(seq $pairs); do
    order="O3 Os"; [ $((i % 2)) = 0 ] && order="Os O3"
    for lv in $order; do
      [ $cond = idle5 ] && sleep 5
      t=$(one $cond $lv); echo "$cond $lv $(python3 -c "print(round($t*1000,1))")"
    done
  done
done
