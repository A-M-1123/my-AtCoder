n, k = gets.split.map(&:to_i)
p = gets.split.map(&:to_i)

p.sort!
sum = 0
for i in 0..(k-1)
  sum += p[i]
end
puts sum