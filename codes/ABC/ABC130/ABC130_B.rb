n, k = gets.split.map(&:to_i)
xs = gets.split.map(&:to_i)
cnt = 1
xa = 0
xs.each do |x|
  if xa + x <= k
    cnt += 1
  else
    break
  end
  xa += x
end
puts cnt  