# wasmtime (Cranelift) host: same protocol as the d8 driver.
# usage: wt_host.py file.wasm samples warmups n [setup]
import sys, time, json, wasmtime as W
path, samples, warmups, n = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4])
setup = sys.argv[5] if len(sys.argv) > 5 and sys.argv[5] != '' else None
cfg = W.Config()
for f in ('wasm_simd', 'wasm_bulk_memory', 'wasm_multi_value', 'wasm_reference_types', 'wasm_tail_call', 'wasm_relaxed_simd'):
    if hasattr(cfg, f): setattr(cfg, f, True)
cfg.cranelift_opt_level = 'speed'; cfg.memory_reservation = 1 << 32; cfg.memory_guard_size = 1 << 16; cfg.signals_based_traps = True
eng = W.Engine(cfg); store = W.Store(eng)
wc = W.WasiConfig(); store.set_wasi(wc)
linker = W.Linker(eng); linker.define_wasi(); linker.allow_shadowing = True
mod = W.Module.from_file(eng, path)
for imp in mod.imports:  # imports beyond WASI trap, like wasi.js's ENOSYS stubs
    if imp.module == 'wasi_snapshot_preview1': continue
    t = imp.type
    if isinstance(t, W.FuncType):
        def stub(*a, _n=imp.name, _r=t.results):
            if _n == 'emscripten_notify_memory_growth': return None
            raise RuntimeError('import ' + _n)
        linker.define(store, imp.module, imp.name, W.Func(store, t, stub))
inst = linker.instantiate(store, mod)
ex = inst.exports(store)
for init in ('_initialize', 'hs_init'):
    if init in ex:
        f = ex[init]
        f(store, 0, 0) if init == 'hs_init' else f(store)
if setup is not None: ex['setup'](store, int(setup))
bench = ex['bench']
norm = lambda r: r & 0xffffffff if isinstance(r, int) else r
run = lambda: norm(bench(store, n))
result = str(run())
for _ in range(warmups): run()
times = []
for _ in range(samples):
    t0 = time.perf_counter(); r = str(run()); times.append((time.perf_counter() - t0) * 1000)
    if r != result: print('DRIVER-ERROR not repeatable'); sys.exit(3)
s = sorted(times); m = len(s) >> 1
print('RESULT ' + json.dumps({'result': result, 'median': s[m] if len(s) % 2 else (s[m-1] + s[m]) / 2, 'best': s[0], 'times': times}))
