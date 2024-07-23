N = gets.to_i
v = gets.split.map(&:to_i)
c = gets.split.map(&:to_i)
d = []
sum = 0

for i in 0..(N-1)
  d[i] = v[i] - c[i]
end
for i in 0..(N-1)
  if d[i] > 0
    sum += d[i]
  end
end
puts sum