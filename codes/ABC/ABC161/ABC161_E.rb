n, k, c = gets.split.map(&:to_i)
s = gets.chomp.split("")

wd = Array.new(n).map{Array.new(3,0)}

#top
cnt = 0
pre = c
for i in 0..(n-1)
  pre += 1
  if s[i]=="o" && pre > c
    wd[i][0] = 1
    pre = 0
    cnt += 1
    break if cnt >= k
  else
    wd[i][0] = 0
  end
end

#bottom
cnt = 0
pre = c
id = n-1
while id >= 0
  pre += 1
  if s[id]=="o" && pre > c
    wd[id][1] = 1
    pre = 0
    cnt += 1
    break if cnt >= k
  else
    wd[id][1] = 0
  end
  id -= 1
end

#both
cnt = 0
tpre = c
bpre = c
tid = 0
bid = n-1
cmp = -1
for i in 1..((k+1)/2)
  while 1
    tpre += 1
    if s[tid]=="o" && tpre > c
      wd[tid][2] = 1
      tpre = 0
      cnt += 1
      cmp = tid if cnt >= k
      tid += 1
      break
    else
      wd[tid][2] = 0
    end
    tid += 1
  end
  while 1
    bpre += 1
    if s[bid]=="o" && bpre > c
      wd[bid][2] = 1
      bpre = 0
      cnt += 1
      if cnt >= k && cmp > -1
        if cmp != bid
          wd[cmp][2] = 0
          wd[bid][2] = 0
        end
      end
      bid -= 1
      break
    else
      wd[bid][2] = 0
    end
    bid -= 1
  end
end

for i in 0..(n-1)
  puts i+1 if wd[i][0]*wd[i][1]*wd[i][2] == 1
end