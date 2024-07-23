n = gets.to_i
p = gets.split.map(&:to_i)
cnt = 0
for i in 1..(n-2)
  pa = [p[i-1], p[i], p[i+1]]
  pa.sort!
  if pa[1] == p[i]
    cnt += 1
  end
end
puts cnt