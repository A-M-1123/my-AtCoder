n = gets.to_i

nd = n.to_s.length

ans = 0
for i in 1..(nd-1)/2
  ans += (10**i-1) - 10**(i-1) + 1
end

if nd % 2 == 0
  hlf = (n.to_s.chomp.split(''))[0..(nd/2-1)].join.to_i
  ans += hlf - 10**(nd/2-1)
  ans += 1 if n >= 10**(nd/2)*hlf+hlf
end

puts ans