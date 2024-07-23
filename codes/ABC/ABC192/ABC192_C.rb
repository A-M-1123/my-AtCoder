n,k = gets.split.map(&:to_i)

for i in 1..k
  nc = n.to_s.chomp.split('')
  nc.sort!{|a,b| b <=> a}
  ln = nc.length
  ai = 0
  for i in 0..(ln-1)
    ai += (nc[i].to_i-nc[ln-1-i].to_i)*(10**(ln-1-i))
  end
  n = ai
end
puts n