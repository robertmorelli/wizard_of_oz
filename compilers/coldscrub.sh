#!/usr/bin/env bash
# Cold CPU vs warm CPU, both with a cold file cache. hyperfine --runs N per build, two conditions:
#   drop   before each run: drop the file cache (as coldstart-rep.sh)
#   scrub  before each run: run a different compiler on the same core (wipes branch predictors,
#          instruction caches, TLBs), then drop the file cache
# usage: compilers/coldscrub.sh RUNS [pin-cmd...]
set -euo pipefail
cd "$(dirname "$0")"
runs=$1; shift
if [ "$(uname)" = Linux ]; then plat=x86; drop='sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null'
else plat=arm64; drop='sync; sudo -n /usr/sbin/purge'; fi
declare -A BIN=([bobby]=jpl-bench [edward]=myjplc [stefan]=rjplc [henry]=jpl-rs)
declare -A OTHER=([bobby]=henry [edward]=stefan [stefan]=henry [henry]=edward)
out=coldscrub-$plat; mkdir -p "$out"
printf '#!/bin/sh\n%s\n' "$drop" > $out/drop.sh
for who in bobby edward stefan henry; do
  o=${OTHER[$who]}
  printf '#!/bin/sh\n%s %s/build/%s-O3/%s %s/t3.jpl -p > /dev/null\n%s\n' "$*" "$PWD" "$o" "${BIN[$o]}" "$PWD" "$drop" > $out/scrub-$who.sh
done
chmod +x $out/*.sh
for who in bobby edward stefan henry; do for m in l p t; do for cond in drop scrub; do
  prep=$PWD/$out/drop.sh; [ $cond = scrub ] && prep=$PWD/$out/scrub-$who.sh
  cmds=(); for lv in O3 Os Oz; do exe=build/$who-$lv/${BIN[$who]}; [ -x "$exe" ] && cmds+=(-n "$lv" "$* $exe t3.jpl -$m"); done
  echo "== $who -$m $cond"
  hyperfine -N --runs "$runs" --prepare "$prep" --export-json "$out/$who-$m-$cond.json" "${cmds[@]}" 2>&1 | grep -E "Time \(|Error" || true
done; done; done
