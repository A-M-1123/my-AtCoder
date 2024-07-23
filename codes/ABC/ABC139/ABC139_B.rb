a, b = gets.split.map(&:to_i)
cnt = 1
cnt = 0 if b == 1
pow = a
while pow < b
  cnt += 1
  pow += a-1
end
puts cnt