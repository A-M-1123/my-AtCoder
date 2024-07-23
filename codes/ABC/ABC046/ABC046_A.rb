a, b, c = gets.chomp.split.map(&:to_i)
cnt = 0
if a == b
  cnt += 1
end
if b == c
  cnt += 1
end
if a == c
  cnt += 1
end
if a == b && b == c
  cnt -= 1
end
puts 3 - cnt


    