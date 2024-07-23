n = gets.to_i
a = gets.split.map(&:to_i)

cro = 1
for i in 0..(n-1)
  cro *= a[i]
end
sum = 0
for i in 0..(n-1)
  sum += cro / a[i]
end

puts cro * 1.0 / sum