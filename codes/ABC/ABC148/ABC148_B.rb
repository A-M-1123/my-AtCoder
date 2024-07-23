n = gets.to_i
a, b = gets.split
a = a.chomp.split("")
b = b.chomp.split("")
for i in 0..(n-1)
  print a[i]
  print b[i]
end
puts ""