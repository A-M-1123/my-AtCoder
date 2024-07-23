MOD = 2019
s = gets.chomp.split("")
ln = s.length

mods = Array.new(ln+1, 0)
num = 0
hoge = 1
for i in 0..(ln-1)
  num = (num + s[ln-1-i].to_i * hoge) % MOD
  mods[ln-1-i] = num
  hoge = (hoge*10) % MOD
end
cmb = Array.new(MOD, 0)
mods.each{|m| cmb[m] += 1}

cnt = 0
for i in 0..(MOD-1)
  cnt += cmb[i]*(cmb[i]-1)/2 if cmb[i] > 1
end
puts cnt