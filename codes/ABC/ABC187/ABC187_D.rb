n = gets.to_i
a,b = n.times.map{gets.split.map(&:to_i)}.transpose

asum = 0
a.each{|e| asum += e}

p = Array.new(n).map{Array.new(3,0)}
for i in 0..(n-1)
  p[i][0] = a[i]
  p[i][1] = b[i]
  p[i][2] = 2*a[i] + b[i]
end
p.sort!{|x,y| y[2] <=> x[2]}

ans = 0
bsum = 0
while asum >= bsum && ans < n
  asum -= p[ans][0]
  bsum += p[ans][2] - p[ans][0]
  ans += 1
end
puts ans