#!/usr/bin/env bash
# build tiny.cpp (and min.cpp) at O2, O3, Os, Oz, run each 3 times interleaved
cd "$(dirname "$0")"; P=../../../programs/knucleotide/cpp/pbds
for f in tiny min; do for l in O2 O3 Os Oz; do /usr/bin/clang++ -$l -std=c++17 -w -I $P $f.cpp -o $f-$l; done
  for i in 1 2 3; do for l in O2 O3 Os Oz; do echo -n "$f $l "; /usr/bin/time -p ./$f-$l 2>&1 | grep -v -e user -e sys | tr '\n' ' '; echo; done; done; done
