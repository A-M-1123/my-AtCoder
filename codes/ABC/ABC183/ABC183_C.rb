def solve(n,k,step,pre,ck,sum)
    if step == n
      if sum+@t[pre-1][0] == k
        return 1
      else
        return 0
      end
    end
    
    rep = 0
    for i in 2..n
      if ck[i] == 0
        ck[i] = 1
        rep += solve(n,k,step+1,i,Marshal.load(Marshal.dump(ck)),sum+@t[pre-1][i-1])
        ck[i] = 0
      end
    end
    return rep
  end
  
  n,k = gets.split.map(&:to_i)
  @t = n.times.map{gets.split.map(&:to_i)}
  
  ck = Array.new(n+1,0)
  ck[1] = 1
  ans = solve(n,k,1,1,Marshal.load(Marshal.dump(ck)),0)
  puts ans