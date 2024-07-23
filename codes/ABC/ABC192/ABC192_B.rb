s = gets.chomp.split('')

flag = 1
for i in 0..(s.length-1)
  if i % 2 == 0
    if s[i] < 'a' || 'z' < s[i]
      flag = 0
      break
    end
  else
    if s[i] < 'A' || 'Z' < s[i]
      flag = 0
      break
    end
  end
end

(flag == 1) ? (puts 'Yes'):(puts 'No')