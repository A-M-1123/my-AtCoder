s = gets.chomp.split("")
t = gets.chomp.split("")

cnt = 0
for i in 0..(s.length-1)
  cnt += 1 if s[i] != t[i]
end
puts cnt