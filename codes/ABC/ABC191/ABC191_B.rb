n,x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

flag = 0
for i in 0..(n-1)
  if a[i] != x
    print " " if flag == 1
    flag = 1
    print "#{a[i]}"
  end
end
puts ""
