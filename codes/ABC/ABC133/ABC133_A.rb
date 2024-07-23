n, a, b = gets.split.map(&:to_i)
if a * n <= b
  puts a * n
else
  puts b
end