def inc(n)
    return (n+1) % 2
  end
  
  n = gets.to_i
  x,y = n.times.map{gets.split.map(&:to_i)}.transpose
  m = gets.to_i
  op = m.times.map{gets.chomp}
  q = gets.to_i
  a,b = q.times.map{gets.split.map(&:to_i)}.transpose
  
  swps = Array.new(m+1,0)  # swap original x & y
  mns = Array.new(m+1).map{Array.new(2,0)}  # minus swp x & y
  ymv = Array.new(m+1).map{Array.new(3,0)}  # op 3
  xmv = Array.new(m+1).map{Array.new(3,0)}  # op 4
  
  for i in 1..m
    if op[i-1] == '1'
      swps[i] = inc(swps[i-1])
      if swps[i] == 1
        mns[i][0] = inc(mns[i-1][0])
        mns[i][1] = mns[i-1][1]
      else
        mns[i][0] = mns[i-1][0]
        mns[i][1] = inc(mns[i-1][1])
      end
      for j in 0..2
        xmv[i][j] = xmv[i-1][j]
        ymv[i][j] = ymv[i-1][j]
      end
    elsif op[i-1] == '2'
      swps[i-1] = inc(swps[i-1])
      if swps[i] == 1
        mns[i][0] = mns[i-1][0]
        mns[i][1] = inc(mns[i-1][1])
      else
        mns[i][0] = inc(mns[i-1][0])
        mns[i][1] = mns[i-1][1]
      end
    else
      swps[i] = swps[i-1]
      for j in 0..1
        mns[i][j] = mns[i-1][j]
      end
      qr = op[i-1].split
      if qr[0] == '3'
        ymv[i][0] = ymv[i-1][0]+1
        ymv[i][1] = ymv[i-1][2] + qr[1].to_i * 2
        ymv[i][2] = ymv[i-1][1]
        for j in 0..2
          xmv[i][j] = xmv[i-1][j]
        end
      else
        xmv[i][0] = xmv[i-1][0]+1
        xmv[i][1] = xmv[i-1][2] + qr[1].to_i * 2
        xmv[i][2] = xmv[i-1][1]
        for j in 0..2
          ymv[i][j] = ymv[i-1][j]
        end
      end
    end
  end
  
  for i in 0..m
    (mns[i][0] == 0) ? (mns[i][0] = 1):(mns[i][0] = -1)
    (mns[i][1] == 0) ? (mns[i][1] = 1):(mns[i][1] = -1)
  end
  
  for i in 0..(q-1)
    (xmv[i][0] % 2 == 0) ? (pls = 1):(pls = -1)
    xi = xmv[i][1] - xmv[i][2] + pls*x[b[i]]
    (ymv[i][0] % 2 == 0) ? (pls = 1):(pls = -1)
    yi = ymv[i][1] - ymv[i][2] + pls*y[b[i]]
    if swps[a[i]] == 0
      puts "#{xi*mns[a[i]][0]} #{yi*mns[a[i]][1]}"
    else
      puts "#{yi*mns[a[i]][1]} #{xi*mns[a[i]][0]}"
    end
  end