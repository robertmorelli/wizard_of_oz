#!/bin/bash
S=$(dirname "$0"); SRC=programs/fannkuchredux/c; out=$1 l=$2; shift 2
/usr/bin/clang -$l "$@" -ffp-contract=off -I native/shim/x86 -I $SRC -I/opt/homebrew/include -w -c ${SRCFILE:-$SRC/fannkuchredux.c} -o $S/$out.o && /usr/bin/clang -$l native/build/driver.o $S/$out.o -o $S/$out -Wl,-dead_strip
