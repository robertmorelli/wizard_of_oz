#!/bin/bash
# ob.sh LIMIT -> median ms of O3 build with opt-bisect-limit=LIMIT
S=$(dirname "$0"); cd ~/Documents/personal-repos/wizard_of_oz
/usr/bin/clang++ -O3 -mllvm -opt-bisect-limit=$1 -ffp-contract=off -I native/shim/x86 -I programs/binarytrees/cpp -I/opt/homebrew/include -w -std=c++17 -DBOOST_POOL_NO_MT -c programs/binarytrees/cpp/binarytrees.cpp -o $S/ob.o 2>/dev/null && /usr/bin/clang++ native/build/driver.o $S/ob.o -o $S/ob -Wl,-dead_strip && $S/ob 18 3 1 | grep -o '"median":[0-9.]*' | cut -d: -f2
