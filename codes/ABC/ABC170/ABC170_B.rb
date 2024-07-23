x,y = gets.split.map(&:to_i)
if 2*x <= y && y <= 4*x && y % 2 == 0
  puts "Yes"
else
  puts "No"
end
