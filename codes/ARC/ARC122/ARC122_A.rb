def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

MOD = 10**9+7
n = getInt
a = getInts

dp = Array.new(n).map{Array.new(2).map{Array.new(2,0)}}
dp[0] = [[a[0], 1], [0, 0]]
dp[1] = [[a[0]+a[1], 1], [a[0]-a[1], 1]] if n >= 2 
for i in 2..(n-1)
  dp[i][0][0] = ((dp[i-1][0][0]+dp[i-1][1][0])%MOD+a[i]*((dp[i-1][0][1]+dp[i-1][1][1])%MOD)) % MOD
  dp[i][0][1] = (dp[i-1][0][1]+dp[i-1][1][1]) % MOD
  dp[i][1][0] = (dp[i-1][0][0]-a[i]*dp[i-1][0][1]) % MOD
  dp[i][1][1] = dp[i-1][0][1]
end
puts (dp[n-1][0][0]+dp[n-1][1][0]) % MOD