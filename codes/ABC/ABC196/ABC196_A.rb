a,b = gets.split.map(&:to_i)
c,d = gets.split.map(&:to_i)

puts [a-c, b-c, a-d, b-d].max
