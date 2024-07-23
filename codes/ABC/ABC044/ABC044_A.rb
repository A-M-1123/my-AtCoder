n = gets.chomp.to_i
k = gets.chomp.to_i
x = gets.chomp.to_i
y = gets.chomp.to_i
if n <= k
  puts x * n
else
  puts x * k + y * (n - k)
end