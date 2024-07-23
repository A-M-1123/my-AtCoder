n, x = gets.chomp.split.map(&:to_i)
if x - 1 < n - x
  puts x - 1
else
  puts n - x
end