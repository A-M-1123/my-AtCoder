n, a, b = gets.split.map(&:to_i)

rp = n/(a+b)
puts rp*a + [n-(a+b)*rp, a].min