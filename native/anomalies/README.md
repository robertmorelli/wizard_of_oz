# Anomaly experiments (see ../ANOMALIES.md)

Run everything from the wizard_of_oz root. Binaries/objects not kept; rebuild.

- knucleotide/: base.cpp, noinl.cpp, phase.cpp (per-k timers), phasecopy.cpp (the `k0` copy fix).
  `knucleotide/b.sh phasecopy O3 ''` -> knucleotide/phasecopy-O3. Add `-mllvm -inline-threshold=1000` for the threshold test.
  kn-*.sample: macOS `sample` profiles.
- binarytrees/: phase.cpp, v1/v2/w1 (make variants; make_inner fix), m-*.cpp + split/ (per-function level mixing),
  ir-*.ll (IR crossing), *.s (make disassembly), *.sample. `SRCFILE=<cpp> binarytrees/b.sh OUT O3`; `binarytrees/ob.sh N` = opt-bisect.
- fannkuchredux/: bar.c (asm-volatile pin). `SRCFILE=native/anomalies/fannkuchredux/bar.c fannkuchredux/b.sh bar-O3 O3`. *.s disassembly.
- spectralnorm/: base/sdiv/shr.swift; build as run-native.mjs does:
  `swiftc -O|-Osize -wmo -parse-as-library -module-name spectralnorm X.swift native/build/driver.o -o OUT -Xlinker -dead_strip`.
  m.c: C microbench of the `/DIVISOR` loop (`clang -O3 -DDIVISOR=2 m.c`). *.s disassembly.

../../analysis/: an.py (compiler stats), an2.py (native stats), rows.py (dashboard rows), accurate-rows.json,
dashboard/ (dashboard page + data). Run from the root: `python3 analysis/an.py arm64 x86`.

- native/one.sh PROG c|cpp O3|Os|Oz [samples warmups]: build + run one C/C++ program (into native/one/).
