def bins(ar, num, st, en, ln)
    mid = (st+en)/2
    if (ar[[mid-1, 0].max] <= num && num <= ar[mid]) || st == en
      return mid
    else
      if num < ar[mid]
        return bins(ar, num, st, mid-1, ln)
      else
        return bins(ar, num, mid+1, en, ln)
      end
    end
  end
  
  def solve(id, pa, dp, ln)
    if dp[ln-1] < @a[id-1]
      dp.push(@a[id-1])
      ln += 1
    elsif @a[id-1] < dp[0]
      dp[0] = @a[id-1]
    else
      dp[bins(dp.dup, @a[id-1], 0, ln-1, ln)] = @a[id-1]
    end
    
    @ans[id] = ln
    
    if @tr[id].length == 1
      return
    else
      @tr[id].each{|chi| solve(chi, id, dp.dup, ln) if chi != pa}
    end
  end
  
  n = gets.to_i
  @a = gets.split.map(&:to_i)
  u, v = (n-1).times.map{gets.split.map(&:to_i)}.transpose
  
  @tr = Array.new(n+1).map{Array.new(0)}
  for i in 0..(n-2)
    @tr[u[i]].push(v[i])
    @tr[v[i]].push(u[i])
  end
  
  @ans = Array.new(n+1, 0)
  dp = Array.new(1)
  dp[0] = @a[0]
  @ans[1] = 1
  @tr[1].each{|chi| solve(chi, 1, dp.dup, 1)}
  for i in 1..n
    puts @ans[i]
  end