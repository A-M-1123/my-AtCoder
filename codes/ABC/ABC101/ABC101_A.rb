s = gets.chomp.split("")
cnt = 0
s.each{|c| cnt += 1 if c == "+"}
puts cnt*2 - 4