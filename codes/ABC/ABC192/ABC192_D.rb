x = gets.chomp.split('').map(&:to_i)
m = gets.to_i

xln = x.length
d = 0
for i in 0..(xln-1)
  d = [d,x[i]].max
end
d += 1

if xln > 1
  maxd = (m**(1.0/(xln-1))).to_i
  (maxd >= d) ? (flag = 1):(flag = 0)
else
  (m > 1) ? (flag = 0):(flag = 1)
  maxd = 2
end

while flag == 1 && maxd > d
  dn = 0
  for i in 0..(xln-1)
    dn += maxd**(xln-1-i)*x[i]
  end
  if dn <= m
    break
  end
  maxd -= 1
end

if flag == 1
  dd = 0
  for i in 0..(xln-1)
    dd += d**(xln-1-i)*x[i]
  end
  d += 1 if dd > m

  puts [maxd-d+1,0].max
else
  puts 0
end