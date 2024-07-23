n = gets.to_i
a = Array.new(n)
for i in 0..(n-1)
  a[i] = gets.to_i
end

maxn = a[0]
nextn = 0

for i in 1..(n-1)
  nextn = a[i] if nextn < a[i]
  if nextn > maxn
    tmp = maxn
    maxn = nextn
    nextn = tmp
  end
end

for i in 0..(n-1)
  if a[i] == maxn
    puts nextn
  else
    puts maxn
  end
end   