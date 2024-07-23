n = gets.to_i
a = gets.split.map(&:to_i)
maxd = 0

for i in 0..(n-2)
  for j in (i+1)..(n-1)
    maxd = [(a[i]-a[j]).abs, maxd].max
  end
end
puts maxd