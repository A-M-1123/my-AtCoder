n = gets.to_i
x, y = n.times.map{gets.split.map(&:to_f)}.transpose

d = Array.new(n).map{Array.new(n, 0.0)}
for i in 0..(n-2)
  for j in (i+1)..(n-1)
    d[i][j] = d[j][i] = ((x[i]-x[j])**2 + (y[i]-y[j])**2)**(0.5)
  end
end

m = 2.0
r = n
for i in 1..(n-1)
  m *= i
  r *= i
end

ave = 0.0
for i in 0..(n-2)
  for j in (i+1)..(n-1)
    ave += d[i][j] * m
  end
end
puts ave / r