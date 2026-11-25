#!/usr/bin/env bash
# Build and run one C/C++ program at one level, all inside wizard_of_oz.
# usage: native/one.sh PROG c|cpp O3|Os|Oz [samples warmups]   (n from programs/PROG/program.json)
# builds native/one/PROG/LANG-LEVEL/bench, prints RESULT {"result","median" ms,...}
set -euo pipefail
cd "$(dirname "$0")/.."
prog=$1 lang=$2 lv=$3 samples=${4:-10} warmups=${5:-3}
src=programs/$prog/$lang out=native/one/$prog/$lang-$lv; mkdir -p $out
read n setup < <(python3 -c "import json;c=json.load(open('programs/$prog/program.json'));s=c.get('setup');print(c['n'], c['n'] if s is True else (s if isinstance(s,int) and not isinstance(s,bool) else ''))")
drv=native/build/driver${setup:+-setup}.o
[ -f $drv ] || /usr/bin/clang -O2 ${setup:+-DHAS_SETUP} -c native/driver.c -o $drv
if [ $lang = cpp ]; then cc=/usr/bin/clang++ std=-std=c++17; else cc=/usr/bin/clang std=; fi
$cc -$lv $std -ffp-contract=off -w -I native/shim/x86 -I $src ${src:+-I $src/pbds} -I/opt/homebrew/include \
  -DBOOST_POOL_NO_MT -c $src/*.$lang -o $out/bench.o
$cc -$lv $drv $out/bench.o -o $out/bench -Wl,-dead_strip
$out/bench $n $samples $warmups $setup
