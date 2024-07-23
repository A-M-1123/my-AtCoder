n,m = map(int, input().split())
h = list(map(int, input().split()))
gd = [1]*n
for i in range(m):
  a,b = map(int, input().split())
  if h[a-1] >= h[b-1]:
    gd[b-1] = 0
  if h[a-1] <= h[b-1]:
    gd[a-1] = 0
cnt = 0
for i in gd:
  cnt += i
print(cnt)