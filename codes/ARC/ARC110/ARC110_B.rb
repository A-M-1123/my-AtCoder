n = gets.to_i
s = gets.chomp.split("").map(&:to_i)

flag = 1
f0 = 0
if n == 2 && s[0]+s[1] == 0
  flag = 0
else
  while f0 < n && s[f0] == 1
    f0 += 1
  end
  if f0 > 2
    flag = 0
  else
    for i in 0..(n-1)
      if (i%3 == f0 && s[i] == 1) || (i%3 != f0 && s[i] == 0)
        flag = 0
        break
      end
    end
  end
end

if flag == 0
  puts 0
else
  if n == 1
    if s[0] == 1
      puts 10**10*2
    else
      puts 10**10
    end
  else
    en = (2-f0)+n
    puts (10**10*3-en)/3+1
  end
end