a,b,c,d = map(int, input().split())
flag = 0
while a > 0:
  c -= b
  if c <= 0:
    flag = 1
    break
  a -= d
if flag == 1:
  print('Yes')
else:
  print('No')