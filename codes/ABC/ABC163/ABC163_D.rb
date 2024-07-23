def sums(st, en)
    return (en*(en+1)/2) - (st*(st-1)/2)
  end
  MOD = 10**9+7
  
  n, k = gets.split.map(&:to_i)
  
  ans = 0
  for i in k..(n+1)
    ans = (ans + sums(n-i+1,n) - sums(0, i-1) + 1) % MOD
  end
  puts ans