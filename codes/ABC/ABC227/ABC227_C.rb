n = gets.to_i
ans = 0
amax = (n**(1.0/3)).round
(1..amax).each do |a|
  bmax = Integer.sqrt(n/a)
  tmp = n/a
  (a..bmax).each do |b|
    ans += tmp/b - b + 1
  end
end
puts ans
