h, w = gets.chomp.split.map(&:to_i)
i, j = gets.chomp.split.map(&:to_i)
wh = (h - i) * (w - j)
puts wh