n = gets.chomp.to_i
a = 1
while (a + 1) ** 2 <= n
  a += 1
end
min = 9999999999
for i in 1..a
  d = (n - i ** 2) / i
  cost = (n - i * (i + d)) + d
  if min > cost
    min = cost
  end
end
puts min