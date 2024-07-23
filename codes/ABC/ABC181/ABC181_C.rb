n = gets.to_i
x,y = n.times.map{gets.split.map(&:to_i)}.transpose

flag = 0
for i in 0..(n-3)
  for j in (i+1)..(n-2)
    for k in (j+1)..(n-1)
      if (x[i]-x[j])*(y[k]-y[i]) == (x[k]-x[i])*(y[i]-y[j])
        flag = 1
        break
      end
    end
  end
end
(flag == 1) ? (puts 'Yes'):(puts 'No')
