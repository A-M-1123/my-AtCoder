import copy

def dfs(ar, num, cnt):
  ar.append(num)
  if cnt < n-1:
    ans = 0
    for i in range(num, m+1):
      rep = dfs(copy.deepcopy(ar), i, cnt+1)
      ans = max([ans, rep])
    return ans
  else:
    ans = 0
    for i in range(q):
      if ar[abcd[i][1]-1] - ar[abcd[i][0]-1] == abcd[i][2]:
        ans += abcd[i][3]
    return ans

n,m,q = map(int, input().split())
abcd = [list(map(int, input().split())) for i in range(q)]

ans = 0
for i in range(1,m+1):
  a = []
  rep = dfs(copy.deepcopy(a), i, 0)
  ans = max([ans, rep])
print(ans)