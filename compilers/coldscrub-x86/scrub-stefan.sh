#!/bin/sh
taskset -c 3 /home/bob/wizard_of_oz/compilers/build/henry-O3/jpl-rs /home/bob/wizard_of_oz/compilers/t3.jpl -p > /dev/null
sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null
