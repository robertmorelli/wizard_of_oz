# wizard_of_oz

Speed vs size optimization levels, measured on the Benchmarks Game programs:
does optimizing for speed (O3) actually buy speed over optimizing for size (Oz)?

- `programs/` — the BG programs and their ports, copied from utu's `benchmarks/bg`
  (each port exports `bench(n)` returning a checksum, and `setup(n)` for input programs).
- `wasm/` — every port's wasm put through Binaryen `wasm-opt -O3` and `-Oz`, timed in d8.
  - `all.json` raw results, `all.log` the run's log, `opt-results.json` the flattened rows.
  - `bench-opt.mjs` the harness (a variant of utu's `scripts/benchmark-bg.mjs`; run from the utu repo).
  - `stats.mjs` paired statistics; `index.html` the dashboard page.
  - Dashboard: https://claude.ai/artifact/VMx8YZxw5AQKj7ekqWDFfp
- `native/` — the same ports built natively (arm64 macOS) at each language's speed and size levels.
  - `node native/run-native.mjs [program ...] [--langs=c,cpp,rust,swift]`
  - C/C++: Apple clang `-O3` / `-Os` / `-Oz`, with `-ffp-contract=off` (wasm has no fused
    multiply-add; clang fuses on arm64 by default, which changed mandelbrot's checksum). Rust: `opt-level` 3 / s / z. Swift: `-O` / `-Osize`.
  - `driver.c` times `bench` like the d8 driver (setup untimed, 1 run, warmups, median of samples).
  - `shim/x86/` maps the C/C++ ports' x86 intrinsics to NEON through SIMDe (rsqrt/rcp made exact,
    as Emscripten does, so checksums match the wasm runs). `shim/rust/wasm32.rs` maps the Rust
    ports' `core::arch::wasm32` intrinsics to NEON.
  - Size: `text` is the linked `__TEXT,__text` bytes; `stripped` the stripped executable.
  - Go, Haskell, Dart, Kotlin have no size level and are left out; JS, AssemblyScript, MoonBit and utu are wasm-only here.

## Wasm findings (Nov 7, 2026; wasm-opt 128, d8)

Oz ÷ O3 across 108 language × program points (95% CI, languages resampled):
run time 0.987 [0.971, 0.998], size 0.962 [0.936, 0.983]. O3 bought no speed over Oz;
where they differed, Oz usually won, often because O3's partial inlining exhausted V8's own
inlining budget (utu tuned nbody/spectralnorm ~2x slower).
