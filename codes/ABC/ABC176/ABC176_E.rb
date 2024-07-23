H,W,M = gets.split.map(&:to_i)
h,w = M.times.map{gets.split.map(&:to_i)}.transpose

hn = Array.new(H+1,0)
wn = Array.new(W+1,0)
winh = Array.new(H+1).map{Array.new(0)}
for i in 0..(M-1)
  hn[h[i]] += 1
  wn[w[i]] += 1
  winh[h[i]].push(w[i])
end

hmax = 0
wmax = 0
for i in 1..H
  hmax = [hmax, hn[i]].max
end
for i in 1..W
  wmax = [wmax, wn[i]].max
end

hmaxid = Array.new(0)
wmaxid = Array.new(0)
for i in 1..H
  hmaxid.push(i) if hmax == hn[i]
end
for i in 1..W
  wmaxid.push(i) if wmax == wn[i]
end
wlen = wmaxid.length

flag = 0
hmaxid.each do |eh|
  winh[eh].sort!
  wid = 0
  for id in 0..(winh[eh].length-1)
    if winh[eh][id] == wmaxid[wid]
      wid += 1
    else
      if winh[eh][id] > wmaxid[wid]
        flag = 1
        break
      end
    end
    break if wid >= wlen
  end
  break if flag == 1
end

puts hmax+wmax-1+flag