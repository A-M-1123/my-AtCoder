INF = 10**12
n,m,l = gets.split.map(&:to_i)
a,b,c = m.times.map{gets.split.map(&:to_i)}.transpose
q = gets.to_i
s,t = q.times.map{gets.split.map(&:to_i)}.transpose

dis = Array.new(n+1).map{Array.new(n+1,INF)}
for i in 1..n
  dis[i][i] = 0
end
for i in 0..(m-1)
  dis[a[i]][b[i]] = dis[b[i]][a[i]] = c[i]
end

for i in 1..n
  for j in 1..n
    for tra in 1..n
      dis[i][j] = [dis[i][j], dis[i][tra]+dis[tra][j]].min
    end
  end
end

cnt = Array.new(n+1).map{Array.new(n+1,INF)}
for i in 1..n
  cnt[i][i] = 0
end
for i in 1..n
  for j in 1..n
    cnt[i][j] = 1 if dis[i][j] > 0 && dis[i][j] <= l
  end
end

for i in 1..n
  for j in 1..n
    for tra in 1..n
      cnt[i][j] = [cnt[i][j], cnt[i][tra]+cnt[tra][j]].min
    end
  end
end


for i in 0..(q-1)
  cnt[s[i]][t[i]] == INF ? (puts -1):(puts cnt[s[i]][t[i]]-1)
end