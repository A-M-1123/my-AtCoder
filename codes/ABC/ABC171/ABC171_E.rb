def to2d(n, len)
    d = Array.new(len, 0)
    for i in 0..(len-1)
      idx = len-1-i
      d[idx] = n / (2**idx)
      n -= d[idx] * (2**idx)
    end
    return d
  end
  
  def tonum(ds, ln)
    rep = 0
    for i in 0..(ln-1)
      rep += 2**i * ds[i]
    end
    return rep
  end
  
  n = gets.to_i
  a = gets.split.map(&:to_i)
  
  ds = Array.new(n).map{Array.new(30, 0)}
  for i in 0..(n-1)
    ds[i] = to2d(a[i], 30)
  end
  
  for dg in 0..(30-1)
    sum = 0
    for i in 1..(n-1)
      sum += ds[i][dg]
    end
    if sum % 2 != ds[0][dg]
      for i in 0..(n-1)
        ds[i][dg] = (ds[i][dg]+1) % 2
      end
    end
  end
  
  ans = Array.new(n-1)
  for i in 0..(n-1)
    ans[i] = tonum(ds[i], 30)
  end
  puts ans.join(" ")