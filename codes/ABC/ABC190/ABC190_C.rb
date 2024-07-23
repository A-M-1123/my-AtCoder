def n2bin(num,ln)
    a = Array.new(ln,0)
    for i in 0..(ln-1)
      exp = ln-1-i
      if num >= 2**exp
        a[i] = 1
        num -= 2**exp
      end
    end
    return a
  end
  
  n,m = gets.split.map(&:to_i)
  a,b = m.times.map{gets.split.map(&:to_i)}.transpose
  k = gets.to_i
  c = k.times.map{gets.split.map(&:to_i)}
  
  ans = 0
  for num in 0..(2**k-1)
    bit = n2bin(num,k)
    ds = Array.new(n+1,0)
    for i in 0..(k-1)
      ds[c[i][bit[i]]] += 1
    end
    cnt = 0
    for i in 0..(m-1)
      cnt += 1 if ds[a[i]] >= 1 && ds[b[i]] >= 1
    end
    ans = [ans,cnt].max
  end
  puts ans