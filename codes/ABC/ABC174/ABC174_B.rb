n,d = gets.split.map(&:to_i)
x,y = n.times.map{gets.split.map(&:to_i)}.transpose

cnt = 0
for i in 0..(n-1)
  cnt += 1 if d**2 >= x[i]**2 + y[i]**2
end
puts cnt