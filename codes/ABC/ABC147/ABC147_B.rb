s = gets.chomp.split("")
cnt = 0
for i in 0..(s.length-1)/2
  cnt += 1 if s[i] != s[s.length-1-i]
end
puts cnt