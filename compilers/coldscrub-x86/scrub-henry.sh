#!/bin/sh
taskset -c 3 /home/bob/wizard_of_oz/compilers/build/edward-O3/myjplc /home/bob/wizard_of_oz/compilers/t3.jpl -p > /dev/null
sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null
