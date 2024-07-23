n,k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
f = gets.split.map(&:to_i)
a.sort!{|a,b| b<=>a}
f.sort!

cs = Array.new(n).map{Array.new(2)}
for i in 0..(n-1)
  cs[i][0] = a[i]*f[i]
  cs[i][1] = f[i]
end
cs.sort!{|a,b| b[0]<=>a[0]}

for i in 1..k
  break if cs[0][0] == 0
  cost = cs[0].dup
  cs[0] = cs[n-1].dup
  id = 0
  while true.class
    if id*2+1 >= n-1
      break
    elsif id*2+2 >= n-1
      if cs[id][0] > cs[id*2+1][0]
        break
      else
        tmp = cs[id].dup
        cs[id] = cs[id*2+1].dup
        cs[id*2+1] = tmp
        id = id*2+1
      end
    else
      if cs[id][0] > cs[id*2+1][0] && cs[id][0] > cs[id*2+2][0]
        break
      else
        bid = id*2+1
        cs[id*2+1][0] >= cs[id*2+2][0] ? (bid=bid):(bid += 1)
        tmp = cs[id].dup
        cs[id] = cs[bid].dup
        cs[bid] = tmp
        id = bid
      end
    end
  end
  cs[n-1] = cost
  cs[n-1][0] = [cs[n-1][0]-cs[n-1][1], 0].max
  id = n-1
  while true.class
    break if id == 0
    if cs[id][0] >= cs[(id-1)/2][0]
      tmp = cs[id].dup
      cs[id] = cs[(id-1)/2].dup
      cs[(id-1)/2] = tmp
      id = (id-1)/2
    else
      break
    end
  end
end
puts cs[0][0]