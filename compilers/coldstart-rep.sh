#!/usr/bin/env bash
# Repeatable cold starts: hyperfine --runs N with --prepare dropping the OS file cache
# before every timed run. Two conditions per compiler × level × job:
#   cold  cache dropped (binary and t3.jpl both read from disk)
#   bin   cache dropped, then t3.jpl read back in (only the compiler binary is cold)
# Also one page-fault count per build and condition (major = read from disk).
# usage: compilers/coldstart-rep.sh RUNS [pin-cmd...]
set -euo pipefail
cd "$(dirname "$0")"
runs=$1; shift
if [ "$(uname)" = Linux ]; then plat=x86; drop='sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null'
else plat=arm64; drop='sync; sudo -n /usr/sbin/purge'; fi
declare -A BIN=([bobby]=jpl-bench [edward]=myjplc [stefan]=rjplc [henry]=jpl-rs)
out=coldrep-$plat; mkdir -p "$out"; faults=$out/faults.tsv; echo -e "who\tlevel\tjob\tcond\tmajor\tminor" > $faults
fault() { # cond exe args...
  local cond=$1; shift
  if [ "$cond" = cold ]; then eval "$drop"; else eval "$drop"; cat t3.jpl > /dev/null; fi
  if [ $plat = x86 ]; then /usr/bin/time -f "%F %R" "$@" > /dev/null 2> /tmp/f.txt; tail -1 /tmp/f.txt
  else /usr/bin/time -l "$@" > /dev/null 2> /tmp/f.txt; echo "$(awk '/page faults/{print $1}' /tmp/f.txt) $(awk '/page reclaims/{print $1}' /tmp/f.txt)"; fi
}
# hyperfine -N runs --prepare without a shell too, so the drops are scripts.
printf '#!/bin/sh\n%s\n' "$drop" > $out/drop.sh; printf '#!/bin/sh\n%s\ncat %s/t3.jpl > /dev/null\n' "$drop" "$PWD" > $out/dropbin.sh; chmod +x $out/drop.sh $out/dropbin.sh
for who in bobby edward stefan henry; do for m in l p t; do
  for cond in cold bin; do
    prep=$PWD/$out/drop.sh; [ $cond = bin ] && prep=$PWD/$out/dropbin.sh
    cmds=()
    for lv in O3 Os Oz; do exe=build/$who-$lv/${BIN[$who]}; [ -x "$exe" ] || continue
      cmds+=(-n "$lv" "$* $exe t3.jpl -$m")
      read maj min < <(fault $cond $exe t3.jpl -$m); echo -e "$who\t$lv\t$m\t$cond\t$maj\t$min" >> $faults
    done
    echo "== $who -$m $cond"
    hyperfine -N --runs "$runs" --prepare "$prep" --export-json "$out/$who-$m-$cond.json" "${cmds[@]}" 2>&1 | grep -E "Time \(|Error" || true
  done
done; done
