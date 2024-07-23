def per(n, r)
    ans = 1
    for i in (n-r+1)..n
      ans *= i
    end
    return ans
  end
    
  n, k = gets.split.map(&:to_i)
  fac = 1
  for i in 1..k
    fac *= i
    ans = (per(n-k+1, i) / fac) * (per(k-1, i-1) / (fac / i))
    puts ans % (10**9 + 7)
  end