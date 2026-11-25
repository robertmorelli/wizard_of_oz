#!/usr/bin/env bash
# Cold start: one run of each compiler × level × job, with the OS file cache dropped
# right before it (Linux drop_caches, macOS purge), so the binary and t3.jpl come off disk.
# Runs go in a shuffled order. Writes coldstart-<plat>.tsv: who level job ms.
# usage: compilers/coldstart.sh [pin-cmd...]
set -euo pipefail
cd "$(dirname "$0")"
if [ "$(uname)" = Linux ]; then plat=x86; drop='sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null'; else plat=arm64; drop='sync; sudo -n /usr/sbin/purge'; fi
declare -A BIN=([bobby]=jpl-bench [edward]=myjplc [stefan]=rjplc [henry]=jpl-rs)
jobs=(); for who in bobby edward stefan henry; do for lv in O3 Os Oz; do [ -x build/$who-$lv/${BIN[$who]} ] || continue; for m in l p t; do jobs+=("$who $lv $m"); done; done; done
out=coldstart-$plat.tsv; echo -e "who\tlevel\tjob\tms" > $out
printf '%s\n' "${jobs[@]}" | (command -v shuf >/dev/null && shuf || sort -R) | while read who lv m; do
  hyperfine -N --runs 1 --prepare "$drop" --export-json /tmp/cold.json "$* build/$who-$lv/${BIN[$who]} t3.jpl -$m" >/dev/null 2>&1 \
    || hyperfine --runs 1 --prepare "$drop" --export-json /tmp/cold.json "$* build/$who-$lv/${BIN[$who]} t3.jpl -$m > /dev/null" >/dev/null 2>&1
  ms=$(python3 -c "import json;print(round(json.load(open('/tmp/cold.json'))['results'][0]['times'][0]*1000,2))")
  echo -e "$who\t$lv\t$m\t$ms" | tee -a $out
done
