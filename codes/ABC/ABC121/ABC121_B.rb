n, m, c = gets.chomp.split.map(&:to_i)
b = gets.chomp.split.map(&:to_i)
cnt = 0
for i in 0..(n-1)
  a = gets.chomp.split.map(&:to_i)
  sum = 0
  for j in 0..(m-1)
    sum += a[j] * b[j]
  end
  sum += c
  if sum > 0
    cnt += 1
  end
end
puts cnt