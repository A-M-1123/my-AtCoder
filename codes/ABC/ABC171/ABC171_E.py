def to2d(n, len):
  d = [0]*len
  for i in range(len):
    idx = len-1-i
    d[idx] = int(n / (2**idx))
    n -= d[idx] * (2**idx)
  return d

def tonum(ds, ln):
  rep = 0
  for i in range(ln):
    rep += 2**i * ds[i]
  return rep

n = int(input())
a = list(map(int, input().split()))

ds = [[0]*n for _ in range(30)]
for i in range(n):
  ds[i] = to2d(a[i], 30)

for dg in range(30):
  sum = 0
  for i in range(1, n):
    sum += ds[i][dg]
  
  if sum % 2 != ds[0][dg]:
    for i in range(n):
      ds[i][dg] = (ds[i][dg]+1) % 2

ans = [0]*n
for i in range(n):
  ans[i] = tonum(ds[i], 30)

print(' '.join(map(str, ans)))