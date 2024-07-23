n = gets.to_i
a = gets.chomp.split.map(&:to_i)

a.sort!{|x,y| y <=> x}
a.uniq!
puts a[1]