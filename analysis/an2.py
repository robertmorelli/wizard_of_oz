import random,statistics as S,collections
random.seed(1)
SP={'c':'O3','cpp':'O3','rust':'3','swift':'O'}; LAB={'s':'Os','z':'Oz','Osize':'Os','Os':'Os','Oz':'Oz'}
def ci(r):
    m=S.median(r); b=sorted(S.median(random.choices(r,k=len(r))) for _ in range(2000)); return m,b[50],b[1949]
res={}
for plat in ['arm64','x86']:
    d=collections.defaultdict(lambda: collections.defaultdict(dict))
    for ln in open(f'native/accurate-{plat}.txt'):
        f=ln.split()
        if len(f)!=5: continue
        p,k,l,i,v=f; d[(p,k)][i][l]=float(v)
    for (p,k),prs in d.items():
        for l in {x for v in prs.values() for x in v}-{SP[k]}:
            r=[v[l]/v[SP[k]] for v in prs.values() if l in v and SP[k] in v]
            if len(r)<3: continue
            m,lo,hi=ci(r); res[(p,k,LAB[l],plat)]=(m,'WIN' if hi<1 else 'loss' if lo>1 else 'tie')
keys=sorted({k[:3] for k in res})
print('prog lang lvl | Mac | x86')
for k in keys:
    a=res.get(k+('arm64',)); b=res.get(k+('x86',))
    f=lambda x:'-' if not x else f'{x[0]:.3f} {x[1]}'
    print(f'{k[0]} {k[1]} {k[2]} | {f(a)} | {f(b)}')
for plat in ['arm64','x86']:
    c=collections.Counter(v[1] for k,v in res.items() if k[3]==plat); print(plat,dict(c))
