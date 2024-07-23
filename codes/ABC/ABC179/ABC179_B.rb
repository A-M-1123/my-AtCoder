n = gets.to_i
a = n.times.map{gets.split.map(&:to_i)}

cnt = 0
flag = 0
ans = 0
for i in 0..(n-1)
  if flag == 0
    if a[i][0] == a[i][1]
      cnt = 1
      flag = 1
    end
  else
    if a[i][0] == a[i][1]
      cnt += 1
    else
      flag = 0
      cnt = 0
    end
    if cnt == 3
      ans = 1
      break
    end
  end
end
(ans == 1) ? (puts "Yes"):(puts "No")