n, k = gets.split.map(&:to_i)
r, s, p = gets.split.map(&:to_i)
t = gets.chomp.split("")

peri = Array.new(k).map{Array.new(0)}
for i in 0..(n-1)
  peri[i%k].push(i)
end

ps = Hash.new(0)
ps["s"] += r
ps["p"] += s
ps["r"] += p

po = 0
for i in 0..(k-1)
  pret = "N"
  peri[i].each do |id|
    if pret != t[id]
      po += ps[t[id]]
      pret = t[id]
    else
      pret = "N"
    end
  end
end
puts po