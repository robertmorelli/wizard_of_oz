// Experiment 2: the same O3/Os/Oz wasm (built by wasm/bench-opt.mjs into utu/.tmp/bg-opt)
// in other engines: V8 baseline only (Liftoff), JavaScriptCore, wasmtime (Cranelift).
// usage: node engines/run-engines.mjs [program ...] [--engines=liftoff,jsc,wasmtime]
// Writes engines/all.json.
import { existsSync, readFileSync, readdirSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
const HERE = path.dirname(fileURLToPath(import.meta.url));
const UTU = path.resolve(HERE, '../../utu');
const BG = path.join(UTU, 'benchmarks/bg'), BUILT = path.join(UTU, '.tmp/bg-opt');
const SHIM = path.join(BG, 'wasi.js');
const JSC = '/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Helpers/jsc';
const opt = k => process.argv.find(a => a.startsWith(`--${k}=`))?.split('=')[1];
const ENGINES = (opt('engines') ?? 'liftoff,jsc,wasmtime').split(',');
const PORTS = ['c', 'cpp', 'rust', 'go', 'swift', 'haskell', 'moonbit', 'assemblyscript'];
const LEVELS = ['O3', 'Os', 'Oz'];
const d8driver = name => path.join(BUILT, name, 'd8-driver.js');
// jsc lacks d8's readbuffer; the rest of the driver is the same.
const jscDriver = name => { const f = path.join(BUILT, name, 'jsc-driver.js'); writeFileSync(f, `globalThis.readbuffer = f => readFile(f, 'binary');\n` + readFileSync(d8driver(name), 'utf8')); return f; };
const cmd = (engine, name, wasm, args) => ({
  liftoff: ['d8', ['--liftoff-only', d8driver(name), '--', 'wasm', wasm, ...args, SHIM]],
  jsc: [JSC, [jscDriver(name), '--', 'wasm', wasm, ...args, SHIM]],
  wasmtime: [path.join(HERE, '../.venv/bin/python'), [path.join(HERE, 'wt_host.py'), wasm, ...args]],
})[engine];
const outFile = path.join(HERE, 'all.json');
const all = existsSync(outFile) ? JSON.parse(readFileSync(outFile, 'utf8')) : {};
const names = process.argv.slice(2).filter(a => !a.startsWith('--'));
for (const name of names.length ? names : readdirSync(BG).filter(n => existsSync(path.join(BG, n, 'program.json'))).sort()) {
  const cfg = JSON.parse(readFileSync(path.join(BG, name, 'program.json'), 'utf8'));
  const setup = cfg.setup === true ? cfg.n : typeof cfg.setup === 'number' ? cfg.setup : '';
  const samples = cfg.samples ?? 10, warmups = cfg.warmups ?? 3;
  console.log(`\n${name}`);
  const rows = (all[name]?.rows ?? []).filter(r => !ENGINES.includes(r.engine));
  for (const engine of ENGINES) for (const key of PORTS) for (const level of LEVELS) {
    const dir = path.join(BUILT, name, `${key}-${level}`);
    const wasm = existsSync(dir) && readdirSync(dir).find(f => f.endsWith('.wasm'));
    if (!wasm) continue;
    const row = { program: name, engine, key, level }; rows.push(row);
    const [bin, args] = cmd(engine, name, path.join(dir, wasm), [samples, warmups, cfg.n, setup].map(String));
    const r = spawnSync(bin, args, { encoding: 'utf8', timeout: 600000, maxBuffer: 64 << 20 });
    const line = r.stdout?.split('\n').find(l => l.startsWith('RESULT '));
    if (!line) { row.error = ((r.stdout ?? '') + (r.stderr ?? '')).trim().split('\n').slice(-2).join(' | ').slice(0, 300) || String(r.signal ?? r.error); console.log(`  ${engine.padEnd(8)} ${key.padEnd(14)} ${level}  FAILED ${row.error.slice(0, 160)}`); continue; }
    Object.assign(row, JSON.parse(line.slice(7)));
    console.log(`  ${engine.padEnd(8)} ${key.padEnd(14)} ${level}  ${row.median.toFixed(1).padStart(8)} ms  ${row.result}`);
  }
  all[name] = { n: cfg.n, setup, samples, warmups, date: new Date().toISOString(), rows };
  writeFileSync(outFile, JSON.stringify(all, null, 1) + '\n');
}
