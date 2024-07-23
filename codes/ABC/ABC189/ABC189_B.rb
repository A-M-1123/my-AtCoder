n,x = gets.split.map(&:to_i)
v,p = n.times.map{gets.split.map(&:to_i)}.transpose

sum = 0.0
ans = -1
for i in 0..(n-1)
  sum += p[i]*v[i]
  if sum > x*100
    ans = i+1
    break
  end
end
puts ans