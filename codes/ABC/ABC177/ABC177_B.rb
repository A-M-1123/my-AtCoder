n = gets.to_i
a = gets.split.map(&:to_i)

ans = 0
h = a[0]
for i in 1..(n-1)
  if h >= a[i]
    ans += h-a[i]
  else
    h = a[i]
  end
end
puts ans