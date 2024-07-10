n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = gets.split.map(&:to_i)
c,d = m.times.map{gets.split.map(&:to_i)}.transpose

dlt = Array.new(n+1,0)
for i in 1..n
  dlt[i] = a[i-1]-b[i-1]
end
nds = Array.new(n+1).map{Array.new(0)}
for i in 0..(m-1)
  nds[c[i]].push(d[i])
  nds[d[i]].push(c[i])
end
for i in 1..n
  nds[i].push(-1)
end

glp = Array.new(0)
glpn = 0
ckd = Array.new(n+1,0)
st = 1
while st <= n
  ids = [st]
  ckd[st] = 1
  len = 1
  i = 0
  while i < len
    nds[ids[i]].each do |e|
      if e > 0 && ckd[e] == 0
        ids.push(e)
        ckd[e] = 1
        len += 1
      end
    end
    i += 1
  end
  glp.push(ids)
  glpn += 1
  
  while st <= n && ckd[st] == 1
    st += 1
  end
end

flag = 1
for i in 0..(glpn-1)
  sum = 0
  glp[i].each{|e| sum += dlt[e]}
  if sum != 0
    flag = 0
    break
  end
end

if flag == 1
  puts "Yes"
else
  puts "No"
end