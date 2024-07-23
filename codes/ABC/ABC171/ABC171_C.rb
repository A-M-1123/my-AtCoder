n = gets.to_i

d = 1
while n > 26**d
  n -= 26**d
  d += 1
end

n -= 1
s = Array.new(d, 0)
for i in 0..(d-1)
  idx = d-1-i
  s[i] = n / (26**idx)
  n -= (26**idx)*s[i]
end

s.each do |cn|
  print (("a").ord+cn).chr
end
puts ""