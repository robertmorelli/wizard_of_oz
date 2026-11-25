// Real programs: four JPL compilers (CS 4470), each built at its O3 / Os / Oz levels
// and timed lexing, parsing and typechecking t3.jpl (12 MB), output to /dev/null.
//   bobby   Zig (src/jpl_bench.zig): ReleaseFast = O3, ReleaseSmall = Oz (Zig has no Os)
//   edward  Rust (EdwardStanford7/CS4470-Rust bf9d62c)       opt-level 3 / s / z
//   stefan  Rust (coravacav/rjplc d1f18f6, + quiet patch)     opt-level 3 / s / z
//   henry   Rust (mt-env/jpl-rs 4acfca1, + quiet patch)       opt-level 3 / s / z
// Rust builds use -C target-cpu=native (as zig build-exe does by default).
// usage: node compilers/run-compilers.mjs [who ...] [--samples=10] [--warmups=2]
// Writes compilers/all.json (all-<platform>.json).
import { existsSync, mkdirSync, readFileSync, writeFileSync, openSync, statSync, copyFileSync } from 'node:fs';
import path from 'node:path';
import { spawnSync } from 'node:child_process';
import { createHash } from 'node:crypto';
import { fileURLToPath } from 'node:url';
const HERE = path.dirname(fileURLToPath(import.meta.url));
const LINUX = process.platform === 'linux';
const opt = k => process.argv.find(a => a.startsWith(`--${k}=`))?.split('=')[1];
const SAMPLES = Number(opt('samples') ?? 10), WARMUPS = Number(opt('warmups') ?? 2);
const INPUT = path.join(HERE, 't3.jpl');
const MODES = [['lex', ['-l']], ['parse', ['-p']], ['typecheck', ['-t']]];
const WHO = {
  bobby: { lang: 'Zig', levels: { O3: 'ReleaseFast', Oz: 'ReleaseSmall' } },
  edward: { lang: 'Rust', bin: 'myjplc', levels: { O3: '3', Os: 's', Oz: 'z' } },
  stefan: { lang: 'Rust', bin: 'rjplc', levels: { O3: '3', Os: 's', Oz: 'z' } },
  henry: { lang: 'Rust', bin: 'jpl-rs', levels: { O3: '3', Os: 's', Oz: 'z' } },
};
function sh(what, cmd, args, o = {}) {
  const r = spawnSync(cmd, args, { encoding: 'utf8', maxBuffer: 64 << 20, ...o });
  if (r.error || r.status !== 0) throw new Error(`${what}: ${(r.stderr || r.stdout || String(r.error)).trim().split('\n').slice(-5).join(' | ')}`);
  return r;
}
function build(who, level, flag) {
  const out = path.join(HERE, 'build', `${who}-${level}`); mkdirSync(out, { recursive: true });
  const src = path.join(HERE, 'src', who);
  if (who === 'bobby') {
    const exe = path.join(out, 'jpl-bench');
    sh('zig', 'zig', ['build-exe', path.join(src, 'src', 'jpl_bench.zig'), `-O${flag}`, `-femit-bin=${exe}`], { cwd: src });
    return exe;
  }
  sh('cargo', 'cargo', ['build', '--release', '--manifest-path', path.join(src, 'Cargo.toml'), '--target-dir', path.join(out, 'target')],
    { env: { ...process.env, CARGO_PROFILE_RELEASE_OPT_LEVEL: flag, RUSTFLAGS: '-C target-cpu=native' } });
  const exe = path.join(out, WHO[who].bin);
  copyFileSync(path.join(out, 'target', 'release', WHO[who].bin), exe);
  return exe;
}
function textSize(exe) {
  if (LINUX) return Number(spawnSync('size', ['-A', exe], { encoding: 'utf8' }).stdout.match(/^\.text\s+(\d+)/m)?.[1] ?? NaN);
  return Number(spawnSync('size', ['-m', exe], { encoding: 'utf8' }).stdout.match(/Section __text: (\d+)/)?.[1] ?? NaN);
}
const devnull = openSync('/dev/null', 'w');
function time(exe, args) {
  const t0 = performance.now();
  const r = spawnSync(exe, [INPUT, ...args], { stdio: ['ignore', devnull, devnull] });
  const ms = performance.now() - t0;
  if (r.status !== 0) throw new Error(`exit ${r.status}`);
  return ms;
}
const outFile = path.join(HERE, `all-${LINUX ? 'x86' : 'arm64'}.json`);
const all = existsSync(outFile) ? JSON.parse(readFileSync(outFile, 'utf8')) : {};
const names = process.argv.slice(2).filter(a => !a.startsWith('--'));
for (const who of names.length ? names : Object.keys(WHO)) {
  const rows = [];
  console.log(`\n${who} (${WHO[who].lang})`);
  for (const [level, flag] of Object.entries(WHO[who].levels)) {
    const row = { who, lang: WHO[who].lang, level, flag }; rows.push(row);
    try {
      const t0 = performance.now(); row.exe = build(who, level, flag); row.buildMs = Math.round(performance.now() - t0);
      row.text = textSize(row.exe); row.file = statSync(row.exe).size;
    } catch (e) { row.error = String(e.message).slice(0, 300); console.log(`  ${level}  BUILD FAILED ${row.error}`); continue; }
    row.modes = {};
    for (const [mode, args] of MODES) {
      const r = spawnSync(row.exe, [INPUT, ...args], { maxBuffer: 1 << 30 });
      const m = row.modes[mode] = { exit: r.status, outBytes: r.stdout?.length ?? 0, hash: createHash('sha1').update(r.stdout ?? '').digest('hex').slice(0, 12) };
      if (r.status !== 0) { m.error = String(r.stderr).slice(-200); console.log(`  ${level} ${mode} FAILED exit ${r.status}`); continue; }
      for (let i = 0; i < WARMUPS; i++) time(row.exe, args);
      const times = []; for (let i = 0; i < SAMPLES; i++) times.push(time(row.exe, args));
      const s = [...times].sort((a, b) => a - b); m.median = SAMPLES % 2 ? s[SAMPLES >> 1] : (s[SAMPLES / 2 - 1] + s[SAMPLES / 2]) / 2; m.times = times;
      console.log(`  ${level.padEnd(3)} ${mode.padEnd(9)} ${m.median.toFixed(1).padStart(8)} ms  text ${row.text} B  out ${m.outBytes} B ${m.hash}`);
    }
  }
  for (const [mode] of MODES) { const hs = new Set(rows.filter(r => r.modes?.[mode]?.median).map(r => r.modes[mode].hash)); if (hs.size > 1) console.log(`  ${mode}: OUTPUT DIFFERS across levels`); }
  all[who] = { date: new Date().toISOString(), samples: SAMPLES, warmups: WARMUPS, rows };
  writeFileSync(outFile, JSON.stringify(all, null, 1) + '\n');
}
