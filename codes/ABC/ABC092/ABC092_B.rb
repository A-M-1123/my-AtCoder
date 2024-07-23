n = gets.to_i
d, x = gets.split.map(&:to_i)
a = n.times.map{gets.to_i}

sum = 0
a.each{|an| sum += (d-1)/an+1}
puts sum+x