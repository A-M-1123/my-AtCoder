n, m = gets.split.map(&:to_i)
a = Array.new(n)
b = Array.new(n)
for i in 0..(n-1) 
  a[i], b[i] = gets.split.map(&:to_i)
end

work = Array.new(m).map{Array.new(0)}
for i in 0..(n-1)
  if a[i] <= m
    work[m-a[i]].push(b[i])
  end
end

for i in 0..(m-1)
  if work[i].length > 0
    work[i].sort!
  end
end

sal = 0
for i in 0..(m-1)
  if work[i].length > 0
    sal += work[i].pop
  else
    max = 0
    id = 0
    for j in (i+1)..(m-1)
      if work[j].length > 0
        pops = work[j].pop
        if max < pops
          max = pops
          id = j
        end
        work[j].push(pops)
      end
    end
    sal += max
    if max > 0
      work[id].pop
    end
  end
end
puts sal