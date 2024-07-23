a,b,n = map(int, input().split())

if n >= b-1:
  print(int(a*(b-1)/b))
else:
  print(int(a*n/b))