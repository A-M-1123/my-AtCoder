n = gets.to_i
a = gets.split.map(&:to_i)

m = Array.new(n, 0)
pms = Array.new(n+1)
mps = Array.new(n+1)

pms[0] = mps[0] = 0
for i in 1..n
  if i % 2 == 1
    pms[i] = pms[i-1] + a[i-1]
    mps[i] = mps[i-1] - a[i-1]
  else
    pms[i] = pms[i-1] - a[i-1]
    mps[i] = mps[i-1] + a[i-1]
  end
end

for i in 0..(n-1)
  if i == 0
    m[i] = pms[n]
  elsif i % 2 == 1
    m[i] = pms[i] + (mps[n] - mps[i])
  else
    m[i] = mps[i] + (pms[n] - pms[i])
  end
end
puts m.join(" ")