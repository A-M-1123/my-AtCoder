n,m = gets.split.map(&:to_i)
a = Array.new(n).map{Array.new(n)}
b = Array.new(m).map{Array.new(m)}
for i in 0..(n-1)
  a[i] = gets.chomp.split("")
end
for i in 0..(m-1)
  b[i] = gets.chomp.split("")
end

ismatch = 0
for x in 0..(n-m)
  for y in 0..(n-m)
    flag = 1
    for i in 0..(m-1)
      for j in 0..(m-1)
        if a[x+i][y+j] != b[i][j]
          flag = 0
          break
        end
      end
      break if flag == 0
    end
    if flag == 1
      ismatch = 1
      break
    end
  end
  break if ismatch == 1
end

ismatch == 1 ? (puts "Yes"):(puts "No")