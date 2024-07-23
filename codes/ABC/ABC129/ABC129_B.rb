n = gets.to_i
w = gets.split.map(&:to_i)
sumw = Array.new(n+1)
sumw[0] = 0
for i in 1..n
  sumw[i] = w[i-1] + sumw[i-1]
end
min = 9999999999
for i in 1..(n-1)
  de = (sumw[i] - (sumw[n] - sumw[i])).abs
  min = de if min > de
end
puts min