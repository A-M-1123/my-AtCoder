n = gets.to_i
c = gets.chomp.split("")

rs = Array.new(n+1,0)
ws = Array.new(n+1,0)
for i in 1..n
  (c[i-1] == "R") ? (k = 1):(k = 0)
    rs[i] = k + rs[i-1]
    ws[i] = (k+1)%2 + ws[i-1]
end

cnt = 0
rmv = 0
for i in 0..(n-1)
  if rs[n]-rs[i]-rmv == 0
    break
  end
  if c[i] == "W"
    rmv += 1
    cnt += 1
  end
end
puts cnt
