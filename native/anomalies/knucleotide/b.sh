#!/bin/bash
# b.sh SRCNAME LEVEL OUTSUFFIX [extra flags...]
S=$(dirname "$0"); SRC=programs/knucleotide/cpp; n=$1 l=$2 suf=$3; shift 3
/usr/bin/clang++ -$l "$@" -ffp-contract=off -I native/shim/x86 -I $SRC -I/opt/homebrew/include -w -std=c++17 -I $SRC/pbds -c $S/$n.cpp -o $S/$n-$l$suf.o && /usr/bin/clang++ -$l native/build/driver-setup.o $S/$n-$l$suf.o -o $S/$n-$l$suf -Wl,-dead_strip
