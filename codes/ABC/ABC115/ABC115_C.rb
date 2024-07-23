n, k = gets.split.map(&:to_i)
h = n.times.map{gets.to_i}
h.sort!
d = 9999999999
for i in 0..(n-k)
  d = h[i+k-1] - h[i] if d > h[i+k-1] - h[i]
end
puts d