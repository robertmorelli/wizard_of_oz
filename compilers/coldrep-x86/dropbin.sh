#!/bin/sh
sync; echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null
cat /home/bob/wizard_of_oz/compilers/t3.jpl > /dev/null
