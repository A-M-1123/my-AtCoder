def solve(dir, cnt, num, bs, lid, rid)
    bbs = bs.dup
    rep = 0
    if dir == 0
      rep += (bbs[0][1]-lid)*bbs[0][0]
      lid += 1
    elsif dir == 1
      rep += (rid-bbs[0][1])*bbs[0][0]
      rid -= 1
    end
    #puts "#{bbs[0][0]} #{dir} #{rep} #{cnt} #{bbs.length}"
    return rep if cnt == num
    
    bbs.shift
    bbs.sort!{|p, q|(q[0]*[(q[1]-lid).abs,(rid-q[1]).abs].max)<=>(p[0]*[(p[1]-lid).abs,(rid-p[1]).abs].max)}
    if bbs[0][1]*2 != lid+rid
      if bbs[0][1]-lid > rid-bbs[0][1]
        return rep + solve(0, cnt+1, num, bbs, lid, rid)
      else
        return rep + solve(1, cnt+1, num, bbs, lid, rid)
      end
    else
      #puts "bunki"
      ans1 = solve(0, cnt+1, num, bbs, lid, rid)
      ans2 = solve(1, cnt+1, num, bbs, lid, rid)
      return rep + [ans1, ans2].max
    end
  end
  
  n = gets.to_i
  a = gets.split.map(&:to_i)
  
  bbs = Array.new(n).map{Array.new(2)}
  for i in 0..(n-1)
    bbs[i][0] = a[i]
    bbs[i][1] = i
  end
  
  lid = 0
  rid = n-1
  
  ans = 0
  bbs.sort!{|p, q|(q[0]*[(q[1]-lid).abs,(rid-q[1]).abs].max)<=>(p[0]*[(p[1]-lid).abs,(rid-p[1]).abs].max)}
  if bbs[0][1]*2 != lid+rid
    if bbs[0][1]-lid > rid-bbs[0][1]
      ans = solve(0, 1, n, bbs, lid, rid)
    else
      ans = solve(1, 1, n, bbs, lid, rid)
    end
  else
    ans1 = solve(0, 1, n, bbs, lid, rid)
    ans2 = solve(1, 1, n, bbs, lid, rid)
    ans = [ans1, ans2].max
  end
  puts ans