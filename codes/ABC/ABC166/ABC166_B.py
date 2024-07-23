n, k = map(int, input().split())
snk = [1]*n
for i in range(k):
  d = int(input())
  for a in (map(int, input().split())):
    snk[a-1] = 0
cnt = 0
for i in snk:
  cnt += i
print(cnt)