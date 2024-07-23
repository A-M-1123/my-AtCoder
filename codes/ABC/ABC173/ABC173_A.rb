n = gets.to_i
if n % 1000 == 0
  puts 0
else
  puts 1000 - (n % 1000)
end