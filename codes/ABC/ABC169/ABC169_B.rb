n = gets.to_i
a = gets.split.map(&:to_i)

flag = 1
for i in 0..(n-1)
  if a[i] == 0
    flag = 0
    puts 0
    break
  end
end
exit if flag == 0

ans = 1
for i in 0..(n-1)
  ans *= a[i]
  flag = 0 if ans > 10**18
  break if flag == 0
end

flag == 1 ? (puts ans):(puts -1)