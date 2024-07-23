n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

tl = Array.new(n,0)
tl[0] = 1
nxt = a[0]
for i in 1..(n-1)
  tl[i] = nxt
  nxt = a[nxt-1]
end
ck = Array.new(n+1,0)
en = n-1
for i in 0..(n-1)
  if ck[tl[i]] == 0
    ck[tl[i]] += 1
  else
    lps = tl[i]
    en = i-1
  end
end

mg = 0
if en != n-1
  for i in 0..en
    if tl[i] == lps
      break
    else
      mg += 1
    end
  end
end

if k <= n-1
  puts tl[k]
else
  puts tl[mg + (k-mg) % (en+1-mg)]
end