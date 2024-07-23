a = []
cnt = 0
for i in 0..4
  a[i] = gets.to_i
  if a[i] % 10 == 0
    cnt += 1
  end
end
a.sort!{|a, b| b % 10 <=> a % 10}
time = 0
for i in 0..4
  if i == 5-cnt-1 || a[i] % 10 == 0
    time += a[i]
  else
    time += (a[i] / 10 + 1) * 10
  end
end
puts time