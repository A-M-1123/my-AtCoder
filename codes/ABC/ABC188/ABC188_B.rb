n = gets.to_i
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)

sum = 0
for i in 0..(n-1)
  sum += a[i]*b[i]
end

(sum == 0) ? (puts 'Yes'):(puts 'No')
