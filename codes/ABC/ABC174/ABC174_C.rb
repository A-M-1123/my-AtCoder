k = gets.to_i

a = Array.new(k,-1)
pre = 7 % k
a[pre] = 1
for i in 2..k
  pre = (pre*10 + 7) % k
  a[pre] = i if a[pre] < 0
end
puts a[0]