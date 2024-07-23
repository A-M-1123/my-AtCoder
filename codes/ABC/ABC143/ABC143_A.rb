a,b = gets.split.map(&:to_i)
if b*2 >= a
  puts 0
else
  puts a - b*2
end