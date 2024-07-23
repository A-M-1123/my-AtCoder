N, M = gets.split.map(&:to_i)
x, y, z = M.times.map{gets.split.map(&:to_i)}.transpose
part = Array.new(N+1, 0)
for i in 1..N
  part[i] = i
end
for i in 0..(M-1)
  min = [part[x[i]], part[y[i]]].min
  part[x[i]] = min
  part[y[i]] = min
end
i = M-1
while i >= 0
  min = [part[x[i]], part[y[i]]].min
  part[x[i]] = min
  part[y[i]] = min
  i -= 1
end
parts = Hash.new(0)
part.each do |v|
  parts[v] += 1 if v > 0
end
cnt = 0
parts.each do |k, v|
  cnt += 1
end
puts cnt