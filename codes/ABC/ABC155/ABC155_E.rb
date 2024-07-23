n = gets.chomp.split("")
len = n.length
mon = Array.new(0)
tmp = 0
fst = 1
ans = 0
id = len-1
while id >= 0
  n[id] = n[id].to_i
  if n[id]+tmp <= 5
    ans += n[id]+tmp
    mon.push(n[id]+tmp)
    fst = 1
    tmp = 0
  else
    ans += 9+fst-n[id]
    mon.push(0)
    fst = 0
    tmp = 1
  end
  if id == 0 && n[id]+tmp == 10
    ans += 1
    mon.push(1)
  end
  id -= 1
end
puts ans

=begin
mon.reverse!
mon.each do |m|
  print m
  sum += m
end
puts ""
=end