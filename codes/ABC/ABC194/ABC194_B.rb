n = gets.to_i
a,b = n.times.map{gets.split.map(&:to_i)}.transpose

ans = 99999999
for i in 0..(n-1)
  for j in 0..(n-1)
    if i == j
      ans = [ans, a[i]+b[i]].min
    else
      ans = [ans, [a[i],b[j]].max].min
    end
  end
end
puts ans