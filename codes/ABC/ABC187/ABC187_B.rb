n = gets.to_i
x,y = n.times.map{gets.split.map(&:to_i)}.transpose

ans = 0
for i in 0..(n-2)
  for j in (i+1)..(n-1)
    ans += 1 if (x[i]-x[j]).abs >= (y[i]-y[j]).abs
  end
end
puts ans