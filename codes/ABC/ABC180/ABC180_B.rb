n = gets.to_i
x = gets.split.map(&:to_i)
 
m = y = c = 0
for i in 0..(n-1)
  m += x[i].abs
  y += x[i]**2
  c = [c, x[i].abs].max
end
puts m
puts y**0.5
puts c