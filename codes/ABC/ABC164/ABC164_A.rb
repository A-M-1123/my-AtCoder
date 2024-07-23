s, w = gets.split.map(&:to_i)
if s <= w
  puts "unsafe"
else
  puts "safe"
end