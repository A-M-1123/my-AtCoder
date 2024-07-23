MOD = 10**9 + 7
n = gets.to_i
a = gets.split.map(&:to_i)

sums = Array.new(n,0)
sums[0] = a[0]
for i in 1..(n-1)
  sums[i] = sums[i-1] + a[i]
end

ans = 0
for i in 1..(n-1)
  id = n-i
  ans += (a[id] * sums[id-1]) % MOD
  ans = ans % MOD
end
puts ans