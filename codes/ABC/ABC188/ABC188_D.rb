N,C = gets.split.map(&:to_i)
a,b,c = N.times.map{gets.split.map(&:to_i)}.transpose

tms = Array.new(2*N,0)
for i in 0..(N-1)
  tms[2*i] = a[i]
  tms[2*i+1] = b[i]+1
end
tms.sort!
tms.uniq!
tln = tms.length

tl = Hash.new(0)
for i in 0..(tln-1)
  tl[tms[i]] = i
end

tbl = Array.new(tln,0)
for i in 0..(N-1)
  tbl[tl[a[i]]] += c[i]
  tbl[tl[b[i]+1]] -= c[i]
end
for i in 0..(tln-1)
  tbl[i] += tbl[i-1] if i > 0
end

ans = 0
for i in 0..(tln-2)
  rg = tms[i+1]-tms[i]
  if tbl[i] > C
    ans += rg*C
  else
    ans += rg*tbl[i]
  end
end
puts ans