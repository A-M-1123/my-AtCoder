a, b, n = gets.split.map(&:to_i)
if b <= n
  puts (a*(b-1)/b).to_i
else
  puts (a*n/b).to_i
end