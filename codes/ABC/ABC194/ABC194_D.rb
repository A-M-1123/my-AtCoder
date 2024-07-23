n = gets.to_i

ans = 0.0
for i in 1..(n-1)
  ans += n*1.0/(n-i)
end
puts ans