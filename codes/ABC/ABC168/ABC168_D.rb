n,m = gets.split.map(&:to_i)
a,b = m.times.map{gets.split.map(&:to_i)}.transpose

pt = Array.new(n+1).map{Array.new(0)}
for i in 0..(m-1)
  pt[a[i]].push(b[i])
  pt[b[i]].push(a[i])
end

vis = Array.new(n+1,0)
ans = Array.new(n+1,0)
ids = Array.new(1,1)

nxt = Array.new(0)
for i in 0..(n-1)
  id = ids[i]
  vis[id] = 1
  pt[id].each do |nx|
    if vis[nx] == 0
      vis[nx] = 1
      ans[nx] = id
      ids.push(nx)
    end
  end
end

puts "Yes"
for i in 2..n
  puts ans[i]
end