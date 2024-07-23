s = []
p = []
for i in 0..2
  s[i] = gets.chomp.split("")
  p[i] = s[i].count
end
nxt = 0
while 1
  p[nxt] -= 1
  if p[nxt] == -1
    break
  end
  c = s[nxt].shift
  if c == "a"
    nxt = 0
  elsif c == "b"
    nxt = 1
  elsif c == "c"
    nxt = 2
  end
end
if nxt == 0
  puts "A"
elsif nxt == 1
  puts "B"
elsif nxt == 2
  puts "C"
end