n, k = gets.split.map(&:to_i)
h = gets.split.map(&:to_i)

cnt = 0
h.each do |hn|
  cnt += 1 if hn >= k
end
puts cnt