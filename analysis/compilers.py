import sys,random,statistics as S,collections
random.seed(1)
def ci(r):
    m=S.median(r); b=sorted(S.median(random.choices(r,k=len(r))) for _ in range(2000)); return m,b[50],b[1949]
def tag(m,lo,hi): return 'WIN' if hi<1 else ('loss' if lo>1 else 'tie')
for plat in sys.argv[1:]:
    d=collections.defaultdict(dict)
    for ln in open(f'compilers/data/accurate-{plat}.txt'):
        f=ln.split()
        if len(f)<12: continue
        c,w,j,lv,p,l=f[:6]; d[(c,w,j,lv)].setdefault(p,{})[l]=(float(f[6]),float(f[7]))
    print(f'== {plat}  (small/O3, <1 = small faster; wall [95% CI]{", user" if plat=="x86" else ""})')
    for k in sorted(d):
        ps=[v for v in d[k].values() if len(v)==2]
        rw=[v[k[3]][0]/v['O3'][0] for v in ps]; ru=[v[k[3]][1]/max(v['O3'][1],.1) for v in ps]
        m,lo,hi=ci(rw); s=f'{k[0]:4} {k[1]:6} {k[2]} {k[3]}  {m:.3f} [{lo:.3f},{hi:.3f}] {tag(m,lo,hi)}'
        if plat=='x86': um,ul,uh=ci(ru); s+=f'   user {um:.3f} {tag(um,ul,uh)}'
        print(s)
