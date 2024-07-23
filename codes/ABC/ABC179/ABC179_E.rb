n,x,m = gets.split.map(&:to_i)

used = Array.new(m,0)
as = Array.new(m,0)
cnt = 1
a = x
as[0] = a
used[a] = 1
again = 1
lpn = 0
while true
  a = a**2 % m
  if a == 0
    again = 0
    break
  end
  if used[a] == 0
    as[cnt] = a
    cnt += 1
    used[a] = 1
  else
    lpn = a
    break
  end
end

if again == 1
  beflp = 0
  aftlp = 0
  lpst = 0
  flag = 0
  for i in 0..(cnt-1)
    if as[i] == lpn
      flag = 1
      lpst = i
    end
    if flag == 0
      beflp += as[i]
    else
      aftlp += as[i]
    end
  end
  
  ans = beflp + aftlp*((n-lpst)/(cnt-lpst))
  for i in 0..(((n-lpst) % (cnt-lpst)) - 1)
    ans += as[i+lpst]
  end
  puts ans
else
  ans = 0
  for i in 0..(cnt-1)
    ans += as[i]
  end
  puts ans
end