x1, y1, x2, y2 = gets.split.map(&:to_i)
dx = x2 - x1
dy = y2 - y1

x3 = x2 - dy
y3 = y2 + dx
x4 = x3 - dx
y4 = y3 - dy

puts "#{x3} #{y3} #{x4} #{y4}"