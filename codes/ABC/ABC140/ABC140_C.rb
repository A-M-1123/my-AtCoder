n = gets.to_i
b = gets.split.map(&:to_i)
a = Array.new(n, -1)
ids = Array.new(n-1)
for i in 0..(n-2)
  ids[i] = i
end

ids.sort!{|x, y| b[x] <=> b[y]}

for i in 0..(n-2)
  a[ids[i]] = b[ids[i]] if a[ids[i]] == -1
  a[ids[i]+1] = b[ids[i]] if a[ids[i]+1] == -1
end
sum = 0
a.each do |an|
  sum += an
end
puts sum