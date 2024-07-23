k, n = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
d = Array.new(n)
for i in 0..(n-2)
  d[i] = a[i+1] - a[i]
end
d[n-1] = k-a[n-1] + a[0]

max = 0
d.each{|dn| max = [max,dn].max}
puts k - max