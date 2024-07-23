def calc_low(n, p)
    low = n / p
    if low != low.to_i
      low = low.to_i + 1
    end
    return low
  end
  
  a, b = gets.split.map(&:to_i)
  
  alow = calc_low(a, 0.08)
  ahigh = calc_low(a+1, 0.08) - 1
  
  blow = calc_low(b, 0.1)
  bhigh = calc_low(b+1, 0.1) - 1
  
  if (alow < bhigh && ahigh < blow) || (blow < ahigh && bhigh < alow)
    puts -1
  else
    puts [alow, blow].max.to_i
  end