s = gets.chomp.split('')
ln = s.length
for i in 0..(ln-1)
  s[i] = s[i].to_i
end

able = 0
if ln == 1
  able = 1 if s[0] == 8
elsif ln == 2
  able = 1 if (s[0]*10+s[1]) % 8 == 0 || (s[1]*10+s[0]) % 8 == 0
else
  ns = Array.new(10,0)
  for i in 0..(ln-1)
    ns[s[i]] += 1
  end
  n = 112
  while n < 1000
    nc = n.to_s.chomp.split('')
    ncs = Array.new(10,0)
    for i in 0..2
      ncs[nc[i].to_i] += 1
    end
    flag = 1
    for i in 0..9
      if ncs[i] > ns[i]
        flag = 0
        break
      end
    end
    if flag == 1
      able = 1
      break
    end
    n += 8
  end
end
(able == 1) ? (puts 'Yes'):(puts 'No')
