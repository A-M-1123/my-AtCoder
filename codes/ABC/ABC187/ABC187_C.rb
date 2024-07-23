n = gets.to_i
s = n.times.map{gets.chomp}

hs1 = Hash.new(0)
hs2 = Hash.new(0)
for i in 0..(n-1)
  cs = s[i].split("")
  if cs[0] == '!'
    k = cs[1..(cs.length-1)].join
    hs1[k] += 1
  else
    hs2[s[i]] += 1
  end
end

flag = 1
hs1.each do |k,v|
  if v >= 1 && hs2[k] >= 1
    puts k
    flag = 0
    break
  end
end
puts 'satisfiable' if flag == 1