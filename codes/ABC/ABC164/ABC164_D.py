from collections import Counter
mod = 2019
s = list(input())
ln = len(s)

ms = [0]*(ln+1)
ms[ln] = 0
cr = 1
for i in range(ln):
  ms[ln-1-i] = (ms[ln-i] + cr*int(s[ln-1-i])) % mod
  cr = (cr*10) % mod

cnts = Counter()
for i in ms:
  cnts[i] += 1
ans = 0
for k,v in cnts.items():
  if v >= 2:
    ans += int(v*(v-1)/2)
print(ans)