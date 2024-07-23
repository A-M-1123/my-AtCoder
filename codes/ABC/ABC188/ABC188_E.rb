INF = 999999999999
n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
x,y = m.times.map{gets.split.map(&:to_i)}.transpose

nds = Array.new(n+1).map{Array.new(0)}
for i in 0..(m-1)
  nds[x[i]].push(y[i])
end
for i in 1..n
  nds[i].push(0)
end

as = Array.new(n).map{Array.new(2,0)}
for i in 0..(n-1)
  as[i][0] = a[i]
  as[i][1] = i+1
end
as.sort!{|i,j| i[0] <=> j[0]}

ans = -INF
ck = Array.new(n+1,0)
id = 0  # about as[]
while id < n
  ids = [as[id][1]]
  max = 0
  ln = 1
  i = 0
  while i < ln
    if i > 0
      ck[ids[i]] = 1
      max = [max, a[ids[i]-1]].max
    end
    
    nds[ids[i]].each do |e|
      if e > 0 && ck[e] == 0
        ids.push(e)
        ln += 1
      end
    end
    i += 1
  end
  
  ans = [ans, max-as[id][0]].max if max > 0
  
  while id < n
    id += 1
    break if id >= n || ck[as[id][1]] == 0
  end
end
puts ans