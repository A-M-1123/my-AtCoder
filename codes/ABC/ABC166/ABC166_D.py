x = int(input())

a = b = -1
con = True
while con:
  a += 1
  b5 = a**5 - x
  b1 = int(abs(b5**0.2))
  if b1**5 == b5:
    b = b1 
    con = False
  elif b1**5 == -1*b5:
    b = -1*b1
    con = False
print(str(a)+' '+str(b))