# Anomaly Repros

Minimal experiments behind the four native size-win investigations in [ANOMALIES.md](../ANOMALIES.md). Run from the repo root.

- `knucleotide/` — `min.cpp`, `tiny.cpp`, `run.sh` (minimal PBDS inlining-threshold repro); `phasecopy.cpp` and `b.sh` (copying the first key fixes O3).
- `binarytrees/` — `v1.cpp`, `w1.cpp`, `b.sh` (`make` frame-save overhead on leaves).
- `fannkuchredux/` — `bar.c`, `b.sh` (`asm volatile` pin for `count_vec` scheduling).
- `spectralnorm/` — `base.swift`, `sdiv.swift`, `shr.swift`, and `m.c` (`sdiv` vs shifted-add `/2` lowering).
