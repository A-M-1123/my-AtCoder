n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
cnt = 0

sum = 0
r = 0
for l in 0..(n-1)
  while sum < k
    if r == n
      break
    else
      sum += a[r]
      r += 1
    end
  end
  break if sum < k
  cnt += n-r+1
  sum -= a[l]
end

puts cnt