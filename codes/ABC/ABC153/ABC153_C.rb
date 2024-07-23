n, k = gets.split.map(&:to_i)
h = gets.split.map(&:to_i)
h.sort!{|a, b| b<=>a}

cnt = 0
for i in 0..(n-1)
  if k > 0
    k -= 1
  else
    cnt += h[i]
  end
end
puts cnt