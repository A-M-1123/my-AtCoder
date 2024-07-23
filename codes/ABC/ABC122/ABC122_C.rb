n,q = gets.split.map(&:to_i)
s = gets.chomp.split("")
lr = q.times.map{gets.split.map(&:to_i)}

lcnt = Array.new(n+1,0)
for i in 1..(n-1)
  s[i-1..i].join == "AC" ? ps = 1 : ps = 0
  lcnt[i+1] = lcnt[i] + ps
end

lr.each do |rn|
  puts lcnt[rn[1]]-lcnt[rn[0]]
end