n = gets.to_i
a = gets.split.map(&:to_i)

ds = Hash.new(0)
for id in 1..n
  ds[id - a[id-1]] += 1 if id - a[id-1] > 0
end

cnt = 0
for id in 1..n
  if ds[id + a[id-1]] > 0
    cnt += ds[id + a[id-1]]
  end
end
puts cnt