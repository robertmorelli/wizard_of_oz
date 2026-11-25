import fs from 'node:fs';
const rows = JSON.parse(fs.readFileSync(process.argv[2] ?? 'wasm/data/opt-results.json', 'utf8')).filter(r => r.ok && r.o3_ms && r.oz_ms);
const lang = p => p.startsWith('utu') ? 'utu' : p;
const anomaly = r => r.program === 'spectralnorm' && ['Dart', 'MoonBit'].includes(r.port);
let seed = 12345; const rnd = () => (seed = (seed * 1103515245 + 12345) % 2147483648) / 2147483648;
const mean = a => a.reduce((s, x) => s + x, 0) / a.length;
const gm = a => Math.exp(mean(a));
function boot(xs, n = 20000) { const m = []; for (let i = 0; i < n; i++) { let s = 0; for (let j = 0; j < xs.length; j++) s += xs[Math.floor(rnd() * xs.length)]; m.push(s / xs.length); } m.sort((a, b) => a - b); return [m[Math.floor(n * .025)], m[Math.floor(n * .975)]]; }
function wilcoxon(xs) { const d = xs.filter(x => x !== 0).map(x => ({ x, a: Math.abs(x) })).sort((a, b) => a.a - b.a); let i = 0; while (i < d.length) { let j = i; while (j + 1 < d.length && d[j + 1].a === d[i].a) j++; const r = (i + j + 2) / 2; for (let k = i; k <= j; k++) d[k].r = r; i = j + 1; } const n = d.length, W = d.filter(e => e.x > 0).reduce((s, e) => s + e.r, 0); const mu = n * (n + 1) / 4, sd = Math.sqrt(n * (n + 1) * (2 * n + 1) / 24); const z = (W - mu) / sd; return { z, p: 2 * (1 - phi(Math.abs(z))) }; }
function phi(z) { const t = 1 / (1 + .2316419 * z), d = .3989423 * Math.exp(-z * z / 2); return 1 - d * t * (.3193815 + t * (-.3565638 + t * (1.781478 + t * (-1.821256 + t * 1.330274)))); }
function signTest(xs) { const pos = xs.filter(x => x > 0).length, neg = xs.filter(x => x < 0).length, n = pos + neg; let c = 0, lgam = k => { let s = 0; for (let i = 2; i <= k; i++) s += Math.log(i); return s; }; const k = Math.min(pos, neg); for (let i = 0; i <= k; i++) c += Math.exp(lgam(n) - lgam(i) - lgam(n - i) - n * Math.log(2)); return { pos, neg, p: Math.min(1, 2 * c) }; }
const pct = x => ((x - 1) * 100).toFixed(2) + '%';
function report(label, set, metric) {
  const xs = set.map(r => Math.log(metric === 'time' ? r.oz_ms / r.o3_ms : r.oz_wasm / r.o3_wasm));
  const [lo, hi] = boot(xs); const w = wilcoxon(xs), s = signTest(xs);
  const big = (t) => xs.filter(x => Math.abs(x) > Math.log(1 + t));
  console.log(`${label.padEnd(44)} n=${String(xs.length).padStart(3)}  Oz/O3 geomean ${pct(gm(xs)).padStart(7)}  95% CI [${pct(Math.exp(lo))}, ${pct(Math.exp(hi))}]  median ${pct(Math.exp([...xs].sort((a,b)=>a-b)[xs.length>>1]))}  Oz-lower ${s.neg} / O3-lower ${s.pos}  sign p=${s.p.toFixed(3)}  Wilcoxon p=${w.p.toFixed(3)}  |>2%|: Oz ${big(.02).filter(x=>x<0).length} O3 ${big(.02).filter(x=>x>0).length}`);
}
const clean = rows.filter(r => !anomaly(r));
for (const metric of ['time', 'size']) {
  console.log(`\n=== ${metric} (ratio Oz/O3; below 0% = Oz lower) ===`);
  report('all builds', rows, metric);
  report('all builds, minus 2 spectralnorm 460ms runs', clean, metric);
  report('excluding utu', clean.filter(r => lang(r.port) !== 'utu'), metric);
  // one point per (language, program): average utu modes so utu doesn't count 4-8x
  const byLP = {}; for (const r of clean) (byLP[lang(r.port) + '|' + r.program] ??= []).push(r);
  const lp = Object.values(byLP).map(g => ({ oz_ms: gm(g.map(r => Math.log(r.oz_ms))), o3_ms: gm(g.map(r => Math.log(r.o3_ms))), oz_wasm: gm(g.map(r => Math.log(r.oz_wasm))), o3_wasm: gm(g.map(r => Math.log(r.o3_wasm))) }));
  report('one point per language×program', lp, metric);
  // per language
  const byL = {}; for (const r of clean) (byL[lang(r.port)] ??= []).push(r);
  for (const [l, g] of Object.entries(byL)) { const xs = g.map(r => Math.log(metric === 'time' ? r.oz_ms / r.o3_ms : r.oz_wasm / r.o3_wasm)); const s = signTest(xs); console.log(`   ${l.padEnd(15)} n=${String(xs.length).padStart(2)}  geomean ${pct(gm(xs)).padStart(7)}  min ${pct(Math.exp(Math.min(...xs))).padStart(7)} max ${pct(Math.exp(Math.max(...xs))).padStart(7)}  Oz-lower ${s.neg} O3-lower ${s.pos}`); }
}
// noise floor: base vs O3 for C/C++/Rust/AS (binaryen already applied; differences ~ noise)
const noise = clean.filter(r => ['C', 'C++', 'Rust', 'AssemblyScript'].includes(r.port)).map(r => Math.log(r.oz_ms / r.o3_ms));
console.log(`\nnoise floor (C, C++, Rust, AS where the pass ~does nothing): sd of log ratio ${(Math.sqrt(mean(noise.map(x => x * x))) * 100).toFixed(2)}%, max |.| ${(Math.max(...noise.map(Math.abs)) * 100).toFixed(2)}%`);
// Cluster bootstrap: resample languages (then programs within), ratio Oz/O3.
{
  const byL = {}; for (const r of clean) { const k = lang(r.port); ((byL[k] ??= {})[r.program] ??= []).push(r); }
  const L = Object.values(byL).map(ps => Object.values(ps).map(g => ({ t: mean(g.map(r => Math.log(r.oz_ms / r.o3_ms))), s: mean(g.map(r => Math.log(r.oz_wasm / r.o3_wasm))) })));
  for (const k of ['t', 's']) {
    const pt = mean(L.flat().map(x => x[k]));
    const m = []; for (let i = 0; i < 20000; i++) { const xs = []; for (let j = 0; j < L.length; j++) { const lg = L[Math.floor(rnd() * L.length)]; for (let q = 0; q < lg.length; q++) xs.push(lg[Math.floor(rnd() * lg.length)][k]); } m.push(mean(xs)); }
    m.sort((a, b) => a - b);
    const sd = Math.sqrt(mean(L.flat().map(x => (x[k] - pt) ** 2)));
    console.log(`CLUSTER ${k === 't' ? 'time' : 'size'} Oz/O3 = ${Math.exp(pt).toFixed(4)}  95% CI [${Math.exp(m[500]).toFixed(4)}, ${Math.exp(m[19500]).toFixed(4)}]  per-program spread (1 sd) ×/÷ ${Math.exp(sd).toFixed(3)}  80% of programs within [${(() => { const v = L.flat().map(x => x[k]).sort((a, b) => a - b); return Math.exp(v[Math.floor(v.length * .1)]).toFixed(3) + ', ' + Math.exp(v[Math.floor(v.length * .9)]).toFixed(3); })()}]`);
  }
}
