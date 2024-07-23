def gcd_impl(n, m)
    for i in 0..9
      t = n - m
      if m > t
        n = m
        m = t
      else
        n = t
      end
      return n if m == 0
    end
    return gcd_impl(m, n%m)
  end
  
  def calc_gcd(n, m)
    (n > m) ? (return gcd_impl(n, m)):(return gcd_impl(m, n))
  end
  
  def calc_lcm(n, m)
    return n*m/calc_gcd(n, m)
  end
  
  n = gets.to_i
  a = gets.split.map(&:to_i)
  
  a.sort!{|p,q| q<=>p}
  
  lc = a[0]
  for i in 1..(n-1)
    lc = calc_lcm(lc, a[i]) if lc % a[i] != 0
  end
  
  sum = 0
  for i in 0..(n-1)
    sum += lc/a[i]
    sum %= 10**9+7
  end
  puts sum