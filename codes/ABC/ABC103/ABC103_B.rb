s = gets.chomp.split("")
t = gets.chomp.split("")
flag = 0
if s == t
  flag = 1
else
  for en in 0..(s.length-2)
    tmp = s.dup
    tmp.slice!(0..en)
    if t.join == tmp.push(s[0..en]).join
      flag = 1
      break
    end
  end
end

flag == 1 ? (puts "Yes"):(puts "No")  