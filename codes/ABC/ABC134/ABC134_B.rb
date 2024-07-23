n, d = gets.split.map(&:to_i)
cnt = 0
while n > 0
  cnt += 1
  n -= 2*d+1
end
puts cnt