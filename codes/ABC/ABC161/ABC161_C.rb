n, k = gets.split.map(&:to_i)
ans = n % k
ans = (ans-k).abs if ans > (ans-k).abs
puts ans