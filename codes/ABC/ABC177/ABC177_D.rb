n,m = gets.split.map(&:to_i)
if m == 0
  puts 1
  exit
end
a,b = m.times.map{gets.split.map(&:to_i)}.transpose

nds = Array.new(n+1).map{Array.new(0)}
for i in 0..(m-1)
  nds[a[i]].push(b[i])
  nds[b[i]].push(a[i])
end
for i in 1..n
  nds[i].push(-1)
end
for i in 1..n
  nds[i].uniq!
end

ckd = Array.new(n+1,0)
lsin = Array.new(n+1,0)
ans = 0
cntn = 1
stid = 1
while cntn == 1
  ls = Array.new(0)
  ls.push(stid)
  lsln = 1
  lsin[stid] = 1
  for i in 0..(lsln-1)
    ckd[ls[i]] = 1
    nds[ls[i]].each do |ch|
      if ch != -1 && lsin[ch] == 0
        ls.push(ch)
        lsln += 1
        lsin[ch] = 1
      end
    end
  end
  ans = [ans,lsln].max
  
  stid += 1
  while stid < n && ckd[stid] == 1
    stid += 1
  end
  if stid >= n
    cntn = 0
  end
end
puts ans