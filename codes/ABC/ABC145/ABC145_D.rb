def kCr(k, r)
    u = 1
    for i in 0..(r-1)
      u *= k-i
      u %= (10**9+7)
    end
    d = 1
    for i in 1..r
      d *= i
      d %= (10**9+7)
    end
    
    while u < d || u % d != 0
        u += 10**9+7
    end
    return u/d
  end
  
  x, y = gets.split.map(&:to_i)
  
  yoko = 0
  for i in 0..(x/2)
    if 2*(x - 2*i) == (y - i)
      yoko = i
      break
    end
    yoko = -1 if i == x/2
  end
  
  if yoko == -1
    puts 0
  else
    tate = x - 2*yoko
    ans = kCr(yoko+tate, [yoko,tate].min)
    puts ans % (10**9+7)
  end