a, b, c, d = gets.split.map(&:to_i)
while a > 0 && c > 0
  c -= b
  break if c <= 0
  a -= d
end
(a > 0) ? (puts "Yes"):(puts "No")