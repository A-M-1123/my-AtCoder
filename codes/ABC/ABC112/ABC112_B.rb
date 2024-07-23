N, T = gets.split.map(&:to_i)
c, t = N.times.map{gets.split.map(&:to_i)}.transpose
INF = 9999999999
cost = INF
for i in 0..(N-1)
  if t[i] <= T
    cost = c[i] if cost > c[i]
  end
end
if cost == INF
  puts "TLE"
else
  puts cost
end