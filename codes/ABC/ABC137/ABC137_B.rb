k, x = gets.split.map(&:to_i)
min = x - k + 1
max = x + k - 1
min = -1000000 if min < -1000000
max = 1000000 if max > 1000000
for i in min..max
  print "#{i} "
end
puts ""