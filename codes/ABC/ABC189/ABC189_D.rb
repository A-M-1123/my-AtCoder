n = gets.to_i
s = n.times.map{gets.chomp}

dp = Array.new(n+1).map{Array.new(2).map{Array.new(2,0)}}  #dp[id][T/F(result)][T/F(id)]
dp[0][0][0] = 1
dp[0][1][1] = 1

for i in 0..(n-1)
  if s[i] == 'OR'
    dp[i+1][0][0] = dp[i][0][0] + dp[i][0][1]
    dp[i+1][0][1] = 0
    dp[i+1][1][0] = dp[i][1][0] + dp[i][1][1]
    dp[i+1][1][1] = dp[i][0][0] + dp[i][0][1] + dp[i][1][0] + dp[i][1][1]
  else
    dp[i+1][0][0] = dp[i][0][0] + dp[i][0][1] + dp[i][1][0] + dp[i][1][1]
    dp[i+1][0][1] = dp[i][0][0] + dp[i][0][1]
    dp[i+1][1][0] = 0
    dp[i+1][1][1] = dp[i][1][0] + dp[i][1][1]
  end
end

puts dp[n][1][0] + dp[n][1][1]