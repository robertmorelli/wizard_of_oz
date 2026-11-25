// Rows for the dashboard: from all.json if present, else parsed from all.log.
import fs from 'node:fs';
const dir = '.tmp/bg-opt';
const d = {};
if (fs.existsSync(`${dir}/all.json`)) {
  for (const [prog, r] of Object.entries(JSON.parse(fs.readFileSync(`${dir}/all.json`, 'utf8'))))
    for (const p of r.ports) (d[prog + '|' + p.name] ??= {})[p.variant] = p.error ? { fail: 1 } : { t: p.median, w: p.wasm, g: p.gzip };
} else {
  let prog, port;
  for (const l of fs.readFileSync(`${dir}/all.log`, 'utf8').split('\n')) {
    let m;
    if ((m = l.match(/^(\w+): n=/))) prog = m[1];
    else if ((m = l.match(/^  (\S.*?)\s+build/))) port = m[1];
    else if ((m = l.match(/^    (base|O3|Oz)\s+([\d.]+) ms\s+wasm (\d+) B, gzip (\d+) B/))) (d[prog + '|' + port] ??= {})[m[1]] = { t: +m[2], w: +m[3], g: +m[4] };
    else if ((m = l.match(/^    (base|O3|Oz)\s+(RUN|OPT) FAILED/))) (d[prog + '|' + port] ??= {})[m[1]] = { fail: 1 };
  }
}
const rows = [];
for (const [k, v] of Object.entries(d)) {
  const [program, port] = k.split('|');
  if (port === 'JavaScript' || !v.O3 || !v.Oz) continue;
  const r = (x, f) => (x && !x.fail ? x[f] : null);
  rows.push({ program, port, base_ms: r(v.base, 't'), o3_ms: r(v.O3, 't'), oz_ms: r(v.Oz, 't'),
    base_wasm: r(v.base, 'w'), o3_wasm: r(v.O3, 'w'), oz_wasm: r(v.Oz, 'w'),
    o3_gzip: r(v.O3, 'g'), oz_gzip: r(v.Oz, 'g'), ok: !(v.O3.fail || v.Oz.fail) });
}
fs.writeFileSync(`${dir}/opt-results.json`, JSON.stringify(rows));
console.log(rows.length, 'rows;', [...new Set(rows.map(r => r.program))].join(','), '; failed:', rows.filter(r => !r.ok).map(r => r.program + '/' + r.port).join(', ') || 'none');
