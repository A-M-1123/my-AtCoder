n = gets.to_i

ans = 0
for i in 1..((n-1)**0.5).to_i
  #puts "#{i} : #{((n-1)/i - i) * 2}"
  ans += ((n-1)/i - i+1) * 2
  ans -= 1 if i*i <= n-1
end
puts ans