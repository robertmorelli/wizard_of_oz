#!/bin/bash
# b.sh OUT LEVEL [flags]  -> builds binarytrees C++ into $S/OUT
S=$(dirname "$0"); SRC=programs/binarytrees/cpp; out=$1 l=$2; shift 2
/usr/bin/clang++ -$l "$@" -ffp-contract=off -I native/shim/x86 -I $SRC -I/opt/homebrew/include -w -std=c++17 -DBOOST_POOL_NO_MT -c ${SRCFILE:-$SRC/binarytrees.cpp} -o $S/$out.o && /usr/bin/clang++ -$l native/build/driver.o $S/$out.o -o $S/$out -Wl,-dead_strip
