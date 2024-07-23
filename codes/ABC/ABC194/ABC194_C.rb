n = gets.to_i
a = gets.split.map(&:to_i)

ns = Array.new(401,0)
for i in 0..(n-1)
  ns[a[i]+200] += 1
end

ans = 0
for i in 0..400
  for j in (i+1)..400
    ans += ns[i]*ns[j]*((i-200)-(j-200))**2
  end
end
puts ans