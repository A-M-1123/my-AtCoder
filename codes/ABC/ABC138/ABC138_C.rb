n = gets.to_i
v = gets.split.map(&:to_i)
for i in 0..(n-1)
  v[i] = v[i] * 1.0
end
v.sort!

ave = (v[0]+v[1]) / 2.0
for i in 2..(n-1)
  ave = (ave+v[i]) / 2.0
end
puts ave