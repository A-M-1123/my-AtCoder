n, m = gets.split.map(&:to_i)
s = Array.new(m)
c = Array.new(m)
for i in 0..(m-1)
  s[i], c[i] = gets.split.map(&:to_i)
end

num = Array.new(n,-1)
flag = 1
for i in 0..(m-1)
  if n != 1 && s[i]+c[i] == 1
    flag = 0
    break
  end
  if num[s[i]-1] == -1
    num[s[i]-1] = c[i]
  elsif num[s[i]-1] != c[i]
    flag = 0
    break
  end
end

if flag == 1
  if n+m == 1 && num[0] == -1
    puts 0
  else
    for i in 0..(n-1)
      num[i] = 1 if i == 0 && num[i] == -1
      num[i] = 0 if i > 0 && num[i] == -1
    end
    puts num.join
  end
else
  puts -1
end