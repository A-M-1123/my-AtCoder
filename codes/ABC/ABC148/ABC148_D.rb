n = gets.to_i
a = gets.split.map(&:to_i)

num = 1
cnt = 0
flag = 0
for i in 0..(n-1)
  if a[i] == num
    num += 1
    flag = 1
  else
    cnt += 1
  end
end

if flag == 1
  if cnt > 0
    puts cnt
  else
  	puts 0
  end
else
  puts -1
end