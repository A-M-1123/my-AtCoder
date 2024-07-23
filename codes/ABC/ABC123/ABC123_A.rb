a = []
for i in 0..4
  a[i] = gets.to_i
end
k = gets.to_i
a.sort!
if a[4] - a[0] > k
  puts ":("
else
  puts "Yay!"
end