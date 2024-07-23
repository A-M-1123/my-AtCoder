s = gets.chomp.split("")
flag = 0

flag += 1 if s[0] == "A"

id = 0
for i in 2..(s.length-2)
  if s[i] == "C"
    flag += 1
    id = i
    break
  end
end

for i in 1..(s.length-1)
  if i != id
    flag -= 1 if s[i] < "a"
  end
end

flag == 2 ? (puts "AC"):(puts "WA")