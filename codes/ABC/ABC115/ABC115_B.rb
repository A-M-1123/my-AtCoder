n = gets.to_i
p = n.times.map{gets.to_i}
p.sort!
p[n-1] /= 2
puts p.inject(:+)