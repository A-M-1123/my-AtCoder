n,s,d = gets.split.map(&:to_i)
x,y = n.times.map{gets.split.map(&:to_i)}.transpose

flag = 0
for i in 0..(n-1)
  if x[i] < s && y[i] > d
    flag = 1
    break
  end
end
(flag == 1) ? (puts 'Yes'):(puts 'No')