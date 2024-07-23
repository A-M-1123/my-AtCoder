n = gets.to_i
a = gets.split.map(&:to_i)

modn = Array.new(200,0)
for i in 0..(n-1)
  modn[a[i]%200] += 1
end

ans = 0
for i in 0..199
  if modn[i] >= 2
    m = modn[i]
    ans += m*(m-1)/2
  end
end
puts ans