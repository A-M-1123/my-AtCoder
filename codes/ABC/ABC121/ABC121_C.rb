n, m = gets.chomp.split.map(&:to_i)
a = Array.new(n, Array.new(2))
for i in 0..(n - 1)
  a[i] = gets.chomp.split.map(&:to_i)
end
a.sort! {|i, j| i[0] <=> j[0]}
money = 0
i = 0
while m > 0
  if m >= a[i][1]
    money += a[i][0] * a[i][1]
    m -= a[i][1]
  else
    money += a[i][0] * m
    break
  end
  i += 1
end
puts money