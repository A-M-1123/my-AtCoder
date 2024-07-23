INF = 10**15
n = gets.to_i
a = gets.split.map(&:to_i)

if n % 2 == 0
  evn = Array.new(n+1,0)
  odd = Array.new(n+1,0)
  for i in 0..(n-1)
    evp = odp = 0
    (i % 2 == 0) ? (evp = a[i]):(odp = a[i])
    evn[i+1] = evn[i] + evp
    odd[i+1] = odd[i] + odp
  end
  ans = -INF
  for i in 0..(n-1)
    if i % 2 == 0
      ans = [ans, evn[i]+odd[n]-odd[i]].max
    end
  end
  ans = [ans, evn[i]].max
  puts ans
else
  dp = Array.new(n).map{Array.new(3).map{Array.new(2,-INF)}}
  ans = -INF
  for i in 0..2
    dp[i][i][0] = a[i]
    dp[i][i][1] = 1
  end
  for i in 0..(n-1)
    for j in 0..2
      if i > j && (i % 2 == j % 2) && dp[i-2][j][1] < n/2
        for k in 0..j
          dp[i][j][0] = [dp[i][j][0], dp[i-2-k][j-k][0]+a[i]].max
        end
        dp[i][j][1] = dp[i-2][j][1] + 1
      end
      ans = [ans, dp[i][j][0]].max if dp[i][j][1] == n/2
    end
  end
  puts ans
end