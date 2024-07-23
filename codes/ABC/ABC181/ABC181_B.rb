def sum1toN(n)
    return 0 if n < 1
    return (1+n)*(n/2)+(n/2+1)*(n%2)
  end
  def rgsum(a,b)
    return sum1toN(b)-sum1toN(a-1)
  end
  
  n = gets.to_i
  a,b = n.times.map{gets.split.map(&:to_i)}.transpose
  
  ans = 0
  for i in 0..(n-1)
    ans += rgsum(a[i],b[i])
  end
  puts ans
  