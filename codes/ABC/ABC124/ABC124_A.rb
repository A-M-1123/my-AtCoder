a = gets.split.map(&:to_i)
a.sort!
if a[0] != a[1]
  puts a[1] * 2 - 1
else
  puts a[1] * 2
end