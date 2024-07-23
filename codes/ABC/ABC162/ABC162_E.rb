MOD = 10**9+7
def modpow(a, n, mod)
  exp = Math.log(n, 2).floor
  rep = modpow_cl(a, n, exp, mod)
  return rep[0]
end

def modpow_cl(a, n, exp, mod)
  if exp < 0
    rep = [1, a]
  else
    if n >= 2**exp
      rep = modpow_cl(a, n-2**exp, exp-1, mod)
      rep[0] = rep[0]*rep[1] % mod
    else
      rep = modpow_cl(a, n, exp-1, mod)
    end
    rep[1] = rep[1]**2 % mod
  end
  return rep
end

n, k = gets.split.map(&:to_i)
cnt = Array.new(k+1, 0)

num = k
while num > 0
  cnt[num] = modpow(k/num, n, MOD)
  id = num*2
  while id <= k
    cnt[num] = (cnt[num]-cnt[id]) % MOD
    id += num
  end
  num -= 1
end

sum = 0
for i in 1..k
  sum = (sum + cnt[i]*i) % MOD
end
puts sum