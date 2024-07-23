def f(n)
    rep = 0
    (n.to_s.chomp.split("")).each{|c|rep += c.to_i}
    return rep
  end
  
  a,b = gets.split.map(&:to_i)
  puts [f(a), f(b)].max