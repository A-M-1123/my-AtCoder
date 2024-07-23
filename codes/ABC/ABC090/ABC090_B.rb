a, b = gets.chomp.split
a = a.to_i
b = b.to_i

cnt = 0
for i in a..b
  s = i.to_s.split("")
  cnt += 1 if s[0]==s[4] && s[1]==s[3]
end
puts cnt