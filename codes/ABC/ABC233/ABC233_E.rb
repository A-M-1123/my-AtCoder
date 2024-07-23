x = gets.chomp.split("")

len = x.length
for i in 0..(len-1)
  x[i] = x[i].to_i
end

xs = Array.new(len)
xs[0] = x[0]
for i in 1..(len-1)
  xs[i] = xs[i-1]+x[i]
end

ans = []
takeover = 0
for i in 0..(len-1)
  id = len-i-1
  xs[id] += takeover
  takeover = xs[id] / 10
  ans.push((xs[id]-takeover*10).to_s)
end
ans.push(takeover.to_s) if takeover > 0
ans.reverse!
puts ans.join