a, b, c, k = gets.split.map(&:to_i)
if a >= k
  puts k
elsif k <= a+b
  puts a
else
  puts a-(k-a-b)
end
  