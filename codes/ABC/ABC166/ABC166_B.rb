n, k = gets.split.map(&:to_i)
snk = Array.new(n+1, 0)
for i in 0..(k-1)
  d = gets.to_i
  a = gets.split.map(&:to_i)
  a.each{|an| snk[an] += 1}
end
cnt = 0
for i in 1..n
  cnt += 1 if snk[i] == 0
end
puts cnt