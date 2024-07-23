def price(n)
    return @a*n + @b*(n.to_s.chomp.split("").length)
  end
  
  def price_frac(le, ri)
    if ri - le <= 1
      (price(ri) <= @x) ? (return ri):(return le)
    end
    mid = (ri-le)/2 + le
    pr = price(mid)
    if @x < pr
      return price_frac(le, mid-1)
    else
      return price_frac(mid, ri)
    end
  end
  
  @a, @b, @x = gets.split.map(&:to_i)
  
  if @a + @b > @x
    puts 0
  else
    pr = price_frac(0, @x)
    (pr < 10**9) ? (puts pr):(puts 10**9)
  end