n = gets.to_i

MOD = 10**9 + 7

if n < 2
  puts 0
  exit
end

exc = 8
odd = 9
all = 10
for i in 2..n
  exc = (exc*8) % MOD
  odd = (odd*9) % MOD
  all = (all*10) % MOD
end
puts (all-odd*2+exc) % MOD