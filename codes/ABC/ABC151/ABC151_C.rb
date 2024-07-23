n, m = gets.split.map(&:to_i)
p = Array.new(m)
s = Array.new(m)
for i in 0..(m-1)
  p[i], s[i] = gets.chomp.split
  p[i] = p[i].to_i
end

acs = Array.new(n+1, 0)
was = Array.new(n+1, 0)
for i in 0..(m-1)
  if s[i] == "AC"
    acs[p[i]] = 1
  elsif acs[p[i]] == 0
    was[p[i]] += 1
  end
end
ac = 0
pn = 0
for i in 1..n
  if acs[i] == 1
    ac += 1
    pn += was[i]
  end
end
puts "#{ac} #{pn}"