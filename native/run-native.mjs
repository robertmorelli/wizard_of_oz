// Native speed-vs-size: each BG port that has a size optimization level, built
// natively (arm64 macOS) at its speed level and its size level(s), timed by
// driver.c, sized by its linked code (__TEXT,__text) and its stripped binary.
//
//   node native/run-native.mjs [program ...] [--langs=c,cpp,rust,swift] [--samples=N] [--warmups=N]
//
// Levels: C and C++ (Apple clang) -O3 / -Os / -Oz; Rust opt-level 3 / s / z
// (lto, codegen-units 1, panic abort, as in each Cargo.toml); Swift -O / -Osize.
// x86 intrinsics in C/C++ map to NEON through SIMDe (shim/x86); the Rust ports'
// core::arch::wasm32 maps to NEON through shim/rust/wasm32.rs. The driver is
// compiled once at -O2 and is the same for every build. C and C++ build with
// -ffp-contract=off: wasm has no fused multiply-add, and clang's default fusing on
// arm64 changes float results (mandelbrot's checksum).
// Writes native/results/<program>.json and native/all.json.
import { existsSync, mkdirSync, readFileSync, readdirSync, writeFileSync, copyFileSync, statSync } from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';

const HERE = path.dirname(fileURLToPath(import.meta.url));
const ROOT = path.dirname(HERE);
const PROGRAMS = path.join(ROOT, 'programs');
const WORK = path.join(HERE, 'build');
const RESULTS = path.join(HERE, 'results');
// LINUX: x86_64 Linux (clang-21, real x86 intrinsics with exact rsqrt/rcp, -march=native).
const LINUX = process.platform === 'linux';
const CC = LINUX ? 'clang-21' : '/usr/bin/clang', CXX = LINUX ? 'clang++-21' : '/usr/bin/clang++', SWIFTC = LINUX ? 'swiftc' : '/usr/bin/swiftc';
const DEAD = LINUX ? ['-Wl,--gc-sections'] : ['-Wl,-dead_strip'];
const SECTIONS = LINUX ? ['-ffunction-sections', '-fdata-sections'] : [];
const opt = name => process.argv.find(a => a.startsWith(`--${name}=`))?.slice(name.length + 3);
const LANGS = (opt('langs') ?? 'c,cpp,rust,swift').split(',');
const LEVELS = { c: ['O3', 'Os', 'Oz'], cpp: ['O3', 'Os', 'Oz'], rust: ['3', 's', 'z'], swift: ['O', 'Osize'] };
const SPEED = { c: 'O3', cpp: 'O3', rust: '3', swift: 'O' };
const SIZE = { c: 'Oz', cpp: 'Oz', rust: 'z', swift: 'Osize' };
const NAMES = { c: 'C', cpp: 'C++', rust: 'Rust', swift: 'Swift' };

function sh(what, cmd, args, o = {}) {
  const r = spawnSync(cmd, args, { encoding: 'utf8', maxBuffer: 64 << 20, timeout: 900000, ...o });
  if (r.error || r.status !== 0) {
    const out = `${r.error ?? ''}${r.stdout}\n${r.stderr}`.trim().split('\n');
    const first = out.find(l => /error/i.test(l)) ?? out[0];
    throw new Error(`${what}: ${first}\n${out.slice(-15).join('\n')}`);
  }
  return r;
}
const rm = d => spawnSync('rm', ['-rf', d]);
const files = (dir, exts) => readdirSync(dir).filter(f => exts.some(e => f.endsWith(e))).map(f => path.join(dir, f));

// The port's flags from program.json, minus Emscripten (-s...) and x86 (-m...) ones.
const portFlags = (cfg, key) => (cfg.flags?.[key] ?? []).filter(f => !/^-(s[A-Z]|m)/.test(f)).map(f => f.replace(/^-Ibenchmarks\/bg\//, `-I${PROGRAMS}/`));

function driverObj(setup) {
  mkdirSync(WORK, { recursive: true });
  const o = path.join(WORK, setup ? 'driver-setup.o' : 'driver.o');
  if (!existsSync(o)) sh('driver', CC, ['-O2', '-c', path.join(HERE, 'driver.c'), '-o', o, ...(setup ? ['-DHAS_SETUP'] : [])]);
  return o;
}

function buildClang(p, key, level, out) {
  const dir = path.join(p.dir, key);
  const compiler = key === 'c' ? CC : CXX;
  const srcs = key === 'c' ? files(dir, ['.c']).filter(f => !(path.basename(f) === 'mini-gmp.c' && false)) : files(dir, ['.cpp', '.cc', '.cxx']);
  const flags = [`-${level}`, '-ffp-contract=off', ...(LINUX ? ['-march=native', ...SECTIONS] : []), '-I', path.join(HERE, 'shim', LINUX ? 'x86-linux' : 'x86'), '-I', dir, ...(LINUX ? [] : ['-I/opt/homebrew/include']), '-w', ...portFlags(p.cfg, key).filter(f => !(LINUX && (f.startsWith('-I/opt/homebrew') || /pbds|pb_ds|gcc/.test(f))))];
  const objs = [];
  // C sources beside C++ ones (a bundled library such as PCRE2) build as C at the same level.
  const cBeside = key === 'cpp' ? files(dir, ['.c']) : [];
  for (const s of [...srcs, ...cBeside]) {
    const o = path.join(out, path.basename(s) + '.o');
    const isC = s.endsWith('.c');
    sh(`${key} ${path.basename(s)}`, isC ? CC : compiler, [...flags.filter(f => !(isC && f.startsWith('-std=c++'))), ...(isC ? [] : (flags.some(f => f.startsWith('-std=')) ? [] : ['-std=c++17'])), '-c', s, '-o', o]);
    objs.push(o);
  }
  // pidigits C keeps mini-gmp.c beside pidigits.c, so it is among srcs already.
  const exe = path.join(out, 'bench');
  sh(`${key} link`, compiler, [`-${level}`, driverObj(p.setup), ...objs, '-o', exe, ...DEAD, ...(LINUX ? ['-lm'] : [])]);
  return exe;
}

function buildRust(p, level, out) {
  const src = path.join(p.dir, 'rust');
  const crate = path.join(out, 'crate');
  rm(crate); mkdirSync(path.join(crate, 'src'), { recursive: true });
  let toml = readFileSync(path.join(src, 'Cargo.toml'), 'utf8').replace(/crate-type\s*=\s*\[[^\]]*\]/, 'crate-type = ["staticlib"]');
  writeFileSync(path.join(crate, 'Cargo.toml'), toml);
  if (existsSync(path.join(src, 'Cargo.lock'))) copyFileSync(path.join(src, 'Cargo.lock'), path.join(crate, 'Cargo.lock'));
  for (const f of readdirSync(path.join(src, 'src'))) {
    let text = readFileSync(path.join(src, 'src', f), 'utf8');
    if (f === 'lib.rs' && /core::arch::wasm32|simd128/.test(text)) {
      text = text.replace(/core::arch::wasm32/g, 'crate::wasm32').replace(/target_feature\s*=\s*"simd128"/g, LINUX ? 'target_arch = "x86_64"' : 'target_arch = "aarch64"')
        .replace(/#\[target_feature\(enable\s*=\s*"simd128"\)\]/g, '');
      text += `\n#[path = ${JSON.stringify(path.join(HERE, 'shim', 'rust', LINUX ? 'wasm32_x86.rs' : 'wasm32.rs'))}]\nmod wasm32;\n`;
    }
    writeFileSync(path.join(crate, 'src', f), text);
  }
  const name = (toml.match(/\[lib\][^[]*?\bname\s*=\s*"([^"]+)"/)?.[1] ?? toml.match(/\[package\][^[]*?\bname\s*=\s*"([^"]+)"/)[1]).replace(/-/g, '_');
  const target = path.join(out, 'target');
  sh('cargo', 'cargo', ['build', '--release', '--lib', '--manifest-path', path.join(crate, 'Cargo.toml'), '--target-dir', target],
    { env: { ...process.env, CARGO_PROFILE_RELEASE_OPT_LEVEL: level, RUSTFLAGS: '-C target-cpu=native' } });
  const exe = path.join(out, 'bench');
  sh('rust link', CC, [driverObj(p.setup), path.join(target, 'release', `lib${name}.a`), '-o', exe, ...DEAD, ...(LINUX ? ['-lpthread', '-ldl', '-lm'] : [])]);
  return exe;
}

function buildSwift(p, level, out) {
  const srcRoot = path.join(p.dir, 'swift', 'Sources');
  const mods = readdirSync(srcRoot);
  const extra = [];
  // A C module beside the Swift one (pidigits' gmp): compile it, import through its modulemap.
  for (const m of mods) {
    const cs = files(path.join(srcRoot, m), ['.c']);
    if (!cs.length) continue;
    for (const c of cs) { const o = path.join(out, path.basename(c) + '.o'); sh(`swift C ${m}`, CC, [level === 'Osize' ? '-Oz' : '-O3', ...(LINUX ? ['-march=native'] : []), '-I', path.join(srcRoot, m, 'include'), '-c', c, '-o', o]); extra.push(o); }
    // SwiftPM generates the modulemap for a C target; do the same.
    const inc = path.join(srcRoot, m, 'include'), mm = path.join(out, 'modules', m);
    mkdirSync(mm, { recursive: true });
    writeFileSync(path.join(mm, 'module.modulemap'), `module ${m} {\n${files(inc, ['.h']).map(h => `  header "${h}"\n`).join('')}  export *\n}\n`);
    extra.push('-I', mm, '-I', inc);
  }
  const swiftMod = mods.find(m => files(path.join(srcRoot, m), ['.swift']).length);
  const srcs = files(path.join(srcRoot, swiftMod), ['.swift']).map(f => {
    const text = readFileSync(f, 'utf8').replace(/@_expose\(wasm,\s*"[^"]*"\)\s*/g, '').replace(/import WASILibc/g, LINUX ? 'import Glibc' : 'import Darwin');
    const g = path.join(out, path.basename(f)); writeFileSync(g, text); return g;
  });
  const exe = path.join(out, 'bench');
  sh('swiftc', SWIFTC, [`-${level}`, '-wmo', '-parse-as-library', '-module-name', swiftMod, ...srcs, driverObj(p.setup), ...extra, '-o', exe, '-Xlinker', LINUX ? '--gc-sections' : '-dead_strip']);
  return exe;
}

function textSize(exe) {
  if (LINUX) return Number(spawnSync('size', ['-A', exe], { encoding: 'utf8' }).stdout.match(/^\.text\s+(\d+)/m)?.[1] ?? NaN);
  const r = spawnSync('size', ['-m', exe], { encoding: 'utf8' }).stdout;
  return Number(r.match(/Section __text: (\d+)/)?.[1] ?? NaN);
}
function strippedSize(exe) {
  const s = exe + '.stripped';
  copyFileSync(exe, s);
  spawnSync('strip', ['-x', s]);
  return statSync(s).size;
}

const known = readdirSync(PROGRAMS).filter(n => existsSync(path.join(PROGRAMS, n, 'program.json'))).sort();
const names = process.argv.slice(2).filter(a => !a.startsWith('--'));
const all = existsSync(path.join(HERE, 'all.json')) ? JSON.parse(readFileSync(path.join(HERE, 'all.json'), 'utf8')) : {};
mkdirSync(RESULTS, { recursive: true });
for (const name of names.length ? names : known) {
  const dir = path.join(PROGRAMS, name);
  const cfg = JSON.parse(readFileSync(path.join(dir, 'program.json'), 'utf8'));
  const setupArg = cfg.setup === true ? cfg.n : typeof cfg.setup === 'number' ? cfg.setup : null;
  const p = { name, dir, cfg, setup: setupArg !== null };
  const samples = Number(opt('samples') ?? cfg.samples ?? 10), warmups = Number(opt('warmups') ?? cfg.warmups ?? 3);
  console.log(`\n${name}: n=${cfg.n}${p.setup ? `, setup(${setupArg})` : ''}`);
  const rows = [];
  for (const key of LANGS) {
    if (!existsSync(path.join(dir, key))) continue;
    for (const level of LEVELS[key]) {
      const row = { program: name, lang: NAMES[key], key, level, role: level === SPEED[key] ? 'speed' : level === SIZE[key] ? 'size' : 'other' };
      rows.push(row);
      process.stdout.write(`  ${NAMES[key].padEnd(6)} ${level.padEnd(6)}`);
      const out = path.join(WORK, name, `${key}-${level}`);
      rm(out); mkdirSync(out, { recursive: true });
      let exe;
      try {
        const t0 = performance.now();
        exe = key === 'rust' ? buildRust(p, level, out) : key === 'swift' ? buildSwift(p, level, out) : buildClang(p, key, level, out);
        row.compileMs = Math.round(performance.now() - t0);
        row.text = textSize(exe); row.stripped = strippedSize(exe);
      } catch (e) { row.error = `build: ${e.message.split('\n')[0]}`; console.log(`BUILD FAILED ${e.message.split('\n').slice(0, 4).join(' | ')}`); continue; }
      const r = spawnSync(exe, [cfg.n, samples, warmups, ...(p.setup ? [setupArg] : [])].map(String), { encoding: 'utf8', timeout: 900000, maxBuffer: 64 << 20 });
      const line = r.stdout?.split('\n').find(l => l.startsWith('RESULT '));
      if (!line) { row.error = `run: ${(r.stdout + r.stderr).trim().split('\n').slice(-3).join(' | ') || r.signal}`; console.log(`RUN FAILED ${row.error}`); continue; }
      Object.assign(row, JSON.parse(line.slice(7)));
      console.log(`${row.median.toFixed(1).padStart(8)} ms  text ${String(row.text).padStart(8)} B  stripped ${String(row.stripped).padStart(8)} B  result ${row.result}`);
    }
  }
  const ok = rows.filter(r => r.result);
  const counts = {}; for (const r of ok) counts[r.result] = (counts[r.result] ?? 0) + 1;
  const expected = Object.entries(counts).sort((a, b) => b[1] - a[1])[0]?.[0];
  const wasmExpected = existsSync(path.join(ROOT, 'wasm', 'all.json')) ? JSON.parse(readFileSync(path.join(ROOT, 'wasm', 'all.json'), 'utf8'))[name]?.result : null;
  for (const r of ok) if (r.result !== expected || (wasmExpected && r.result !== String(wasmExpected))) { r.error = `wrong result ${r.result} (expected ${wasmExpected ?? expected})`; console.log(`  ${r.lang} ${r.level}: ${r.error}`); }
  // A run of some languages keeps the other languages' earlier rows.
  const kept = (all[name]?.rows ?? []).filter(r => !rows.some(q => q.key === r.key));
  const result = { n: cfg.n, setup: setupArg, samples, warmups, expected: wasmExpected != null ? String(wasmExpected) : expected, date: new Date().toISOString(), rows: [...kept, ...rows] };
  writeFileSync(path.join(RESULTS, `${name}.json`), JSON.stringify(result, null, 1) + '\n');
  all[name] = result;
  writeFileSync(path.join(HERE, 'all.json'), JSON.stringify(all, null, 1) + '\n');
}
