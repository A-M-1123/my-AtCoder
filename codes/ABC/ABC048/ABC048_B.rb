a, b, x = gets.chomp.split.map(&:to_i)
if a % x != 0
  if a < x
    a = x
  else
    a = x * (a / x + 1)
  end
end
puts (b-a) / x + 1