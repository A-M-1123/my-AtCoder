x,y = gets.split.map(&:to_i)

if [x,y].min + 3 > [x,y].max
  puts 'Yes'
else
  puts 'No'
end