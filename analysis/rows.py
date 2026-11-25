import random,statistics as S,collections,json
random.seed(1)
def ci(r):
    m=S.median(r); b=sorted(S.median(random.choices(r,k=len(r))) for _ in range(2000)); return m,b[50],b[1949]
V=lambda lo,hi:'win' if hi<1 else 'loss' if lo>1 else 'tie'
PL={'arm64':'Mac','x86':'x86'}; rows=[]
JOB={'l':'lex','p':'parse','t':'typecheck'}
for plat in PL:
    d=collections.defaultdict(dict)
    for ln in open(f'compilers/accurate-{plat}.txt'):
        f=ln.split()
        if len(f)<12: continue
        c,w,j,lv,p,l=f[:6]; d[(c,w,j,lv)].setdefault(p,{})[l]=(float(f[6]),float(f[7]))
    for (c,w,j,lv),pp in d.items():
        ps=[v for v in pp.values() if len(v)==2]
        m,lo,hi=ci([v[lv][0]/v['O3'][0] for v in ps]); um,ul,uh=ci([v[lv][1]/max(v['O3'][1],.1) for v in ps])
        rows.append(dict(id=f'jpl-{c}-{w}-{j}-{lv}-{PL[plat]}',suite=f'JPL {c}',program=w,lang=JOB[j],level=lv,machine=PL[plat],ratio=round(m,4),lo=round(lo,4),hi=round(hi,4),verdict=V(lo,hi),cpu=round(um,4),cpu_verdict=V(ul,uh),pairs=len(ps)))
SP={'c':'O3','cpp':'O3','rust':'3','swift':'O'}; LAB={'s':'Os','z':'Oz','Osize':'Os','Os':'Os','Oz':'Oz'}; LN={'c':'C','cpp':'C++','rust':'Rust','swift':'Swift'}
for plat in PL:
    d=collections.defaultdict(lambda: collections.defaultdict(dict))
    for ln in open(f'native/accurate-{plat}.txt'):
        f=ln.split()
        if len(f)!=5: continue
        p,k,l,i,v=f; d[(p,k)][i][l]=float(v)
    for (p,k),prs in d.items():
        for l in sorted({x for v in prs.values() for x in v}-{SP[k]}):
            r=[v[l]/v[SP[k]] for v in prs.values() if l in v and SP[k] in v]
            m,lo,hi=ci(r)
            rows.append(dict(id=f'bg-{p}-{k}-{LAB[l]}-{PL[plat]}',suite='Native',program=p,lang=LN[k],level=LAB[l],machine=PL[plat],ratio=round(m,4),lo=round(lo,4),hi=round(hi,4),verdict=V(lo,hi),cpu=None,cpu_verdict=None,pairs=len(r)))
json.dump(rows,open(f'{__import__("sys").argv[1]}/accurate-rows.json','w'))
print(len(rows), collections.Counter((r['suite'],r['machine'],r['verdict']) for r in rows))
