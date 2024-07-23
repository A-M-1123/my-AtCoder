n, x, y = gets.split.map(&:to_i)
ans = Array.new(n, 0)
for k in 1..(n-1)
  ans[k] = n-k
end

for k in 1..(n-1)
  for i in 1..(y-1)
    dx = (i-x).abs
    if dx < k
      lf = y-(k-dx-1)
      ri = y+(k-dx-1)
      if 1 <= lf && lf-i > k
        ans[lf-i] -= 1
        ans[k] += 1
      end
      if ri <= n && ri-i > k && lf != ri
        ans[ri-i] -= 1
        ans[k] += 1
      end
    end
  end
end
for k in 1..(n-1)
  puts ans[k]
end