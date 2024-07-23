n, l = gets.split.map(&:to_i)
absmin = 9999999999
for i in 0..(n-1)
  pt = l + i
  absmin = pt if pt.abs < absmin.abs
end
sum = 0
for i in 0..(n-1)
  sum += l + i
end
puts sum - absmin