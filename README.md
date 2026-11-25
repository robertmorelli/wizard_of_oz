# wizard_of_oz

Does optimizing for speed (`-O3` / `-O`) actually beat optimizing for size (`-Os` / `-Oz` / `-Osize`)?

Measured across three setups:

1. **WebAssembly (`wasm/`, `engines/`)** — Benchmarks Game ports run through Binaryen `wasm-opt` at `-O3`, `-Os`, and `-Oz` (plus source-level size flags), timed in V8 (`d8`, TurboFan and Liftoff), JavaScriptCore, and Wasmtime.
2. **Native Benchmarks Game (`native/`)** — C, C++, Rust, and Swift ports compiled natively on macOS `arm64` and Linux `x86_64`, with paired runs and root-cause writeups for the cases where size builds won.
3. **Compilers (`compilers/`)** — Four JPL compilers (Rust and Zig) compiled at `-O3`/`-Os`/`-Oz`, timed warm and cold on `arm64` and `x86_64`.

## Summary

- **WebAssembly (`wasm-opt -Oz` vs `-O3`, V8/d8, 108 language × program pairs):** `Oz / O3` run time **0.987** (95% CI `[0.971, 0.998]`), binary size **0.962** (`[0.936, 0.983]`). `-O3` bought no speed over `-Oz`; where they differed, `-Oz` usually won because `-O3`'s partial inlining blew V8's inlining budget.
- **Native Benchmarks Game (`arm64` & `x86_64`, paired runs):** `-O3` won almost everywhere (54/70 losses for small builds on Mac, 57/70 on x86). Four real Mac `arm64` wins (`knucleotide` C++ `-Os` 0.70×, `binarytrees` C++ `-Oz` 0.89×, `spectralnorm` Swift `-Osize` 0.93×, `fannkuchredux` C `-Oz` 0.95×) came down to specific inlining, register-save, scheduling, and `/2` lowering quirks — documented in [native/ANOMALIES.md](native/ANOMALIES.md).
- **Compilers (warm & cold, paired runs):** `-O3` won across the board once measurement artifacts were removed (hyperfine post-purge launch overhead on macOS; Hyper-V free-page reporting under WSL2 on x86). Details in [compilers/FINDINGS.md](compilers/FINDINGS.md).

## Layout

- `programs/` — Benchmarks Game ports (copied from [utu](https://github.com/robertmorelli/utu)).
- `wasm/` — Binaryen `wasm-opt` harness, stats script, and `data/`.
- `engines/` — Multi-engine Wasm runner (`liftoff`, `jsc`, `wasmtime`) and `all.json`.
- `native/` — Native build/timing harness, SIMD shims, `data/`, [ANOMALIES.md](native/ANOMALIES.md), and minimal repros in `anomalies/`.
- `compilers/` — Compiler timing harness (`timeit.c`, `accurate.sh`), `data/`, and [FINDINGS.md](compilers/FINDINGS.md).
- `analysis/` — Summary scripts (`compilers.py`, `native.py`, `export_rows.py`) and `accurate-rows.json`.

## Reproducing the summaries

```bash
node wasm/stats.mjs
python3 analysis/native.py
python3 analysis/compilers.py arm64 x86
```

Earlier raw logs and intermediate experiment files are preserved on the [`old`](../../tree/old) branch.
