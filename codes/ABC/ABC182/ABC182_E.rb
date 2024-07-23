h,w,n,m = gets.split.map(&:to_i)
a = n.times.map{gets.split.map(&:to_i)}
c = m.times.map{gets.split.map(&:to_i)}

set = Array.new(h+1).map{Array.new(w+1,0)}
lgt = Array.new(h+1).map{Array.new(w+1,0)}

for i in 0..(n-1)
  set[a[i][0]][a[i][1]] = 1
end
for i in 0..(m-1)
  set[c[i][0]][c[i][1]] = -1
end

for i in 1..h
  swt = 0
  for j in 1..w
    if lgt[i][j] == 0
      if set[i][j] == 1
        swt = 1
      elsif set[i][j] == -1
        swt = 0
      elsif swt == 1
        lgt[i][j] = 1
      end
    end
  end
  
  swt = 0
  j = w
  while 1 <= j
    if lgt[i][j] == 0
      if set[i][j] == 1
        swt = 1
      elsif set[i][j] == -1
        swt = 0
      elsif swt == 1
        lgt[i][j] = 1
      end
    end
    j -= 1
  end
end

for i in 1..w
  swt = 0
  for j in 1..h
    if lgt[j][i] == 0
      if set[j][i] == 1
        swt = 1
      elsif set[j][i] == -1
        swt = 0
      elsif swt == 1
        lgt[j][i] = 1
      end
    end
  end
  
  swt = 0
  j = h
  while 1 <= j
    if lgt[j][i] == 0
      if set[j][i] == 1
        swt = 1
      elsif set[j][i] == -1
        swt = 0
      elsif swt == 1
        lgt[j][i] = 1
      end
    end
    j -= 1
  end
end

ans = 0
for i in 1..h
  for j in 1..w
    ans += lgt[i][j]
    ans += 1 if set[i][j] == 1
  end
end
puts ans