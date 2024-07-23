def tobit(n, ln)
    a = Array.new(ln)
    for i in 0..(ln-1)
      a[ln-1-i] = n / (2**(ln-1-i))
      n -= a[ln-1-i]*(2**(ln-1-i))
    end
    return a
  end
  
  INF = 999999999
  n,m,x = gets.split.map(&:to_i)
  a = Array.new(n).map{Array.new(m+1)}
  for i in 0..(n-1)
    a[i] = gets.split.map(&:to_i)
  end
  
  ans = INF
  for bit in 0..(2**n-1)
    b = tobit(bit, n)
    cnt = Array.new(m,0)
    cost = 0
    for i in 0..(n-1)
      if b[i] == 1
        for j in 1..m
          cnt[j-1] += a[i][j]
        end
        cost += a[i][0]
      end
    end
    flag = 1
    for i in 0..(m-1)
      if cnt[i] < x
        flag = 0
        break
      end
    end
    ans = [ans,cost].min if flag == 1
  end
  (ans < INF) ? (puts ans):(puts -1)