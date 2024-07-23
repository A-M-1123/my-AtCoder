n = gets.to_i
x = gets.split.map(&:to_i)

min = 10**10
for i in 1..100
  sum = 0
  for j in 0..(n-1)
    sum += (i-x[j])**2
  end
  min = [min,sum].min
end
puts min