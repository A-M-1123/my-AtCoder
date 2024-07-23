x = gets.to_i
n = 100
y = 0
while n < x
  y += 1
  n *= 1.01
  n = n.to_i
end
puts y