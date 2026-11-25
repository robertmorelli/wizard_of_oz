#!/usr/bin/env bash
# Everything, carefully: JPL compilers (warm + cold, 30 pairs) then native Benchmarks Game
# programs (10 pairs). Run with the machine plugged in and otherwise idle.
# usage: accurate-all.sh [pin...]
set -euo pipefail
cd "$(dirname "$0")"
plat=$( [ "$(uname)" = Linux ] && echo x86 || echo arm64 )
compilers/accurate.sh 30 "$@" > compilers/accurate-$plat.txt
native/accurate-native.sh 10 "$@" > native/accurate-$plat.txt
echo done
