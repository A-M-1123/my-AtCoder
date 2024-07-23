n = gets.to_i
h = gets.split.map(&:to_i)
max = h.max
cnt = 0
for i in 0..(max-1)
  ifwt = -1
  for j in 0..(n-1)
    if h[j] > i && ifwt == -1
      ifwt *= -1
      cnt += 1
    elsif h[j] <= i && ifwt == 1
      ifwt *= -1
    end
  end
end
puts cnt