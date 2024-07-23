n = gets.to_i
a = gets.split.map(&:to_i)

abssum = 0
absmin = 10**9+1
minuscnt = 0
for i in 0..(n-1)
  minuscnt += 1 if a[i] < 0
  abssum += a[i].abs
  absmin = a[i].abs if absmin > a[i].abs
end

if minuscnt % 2 == 0
  puts abssum
else
  puts abssum - (absmin * 2)
end