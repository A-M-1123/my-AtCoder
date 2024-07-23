n = gets.to_i
a = gets.split.map(&:to_i)

moda = Array.new(a)
modn = Array.new(200,0)
for i in 0..(n-1)
  moda[i] = a[i] % 200
  modn[moda[i]] += 1
end

ifTwo = false
modnTwo = -1
for i in 0..199
  if modn[i] >= 2
    ifTwo = true
    modnTwo = i
    break
  end
end

if ifTwo
  id = 0
  ans = Array.new(2)
  for i in 0..(n-1)
    if moda[i] == modnTwo
      ans[id] = i
      id += 1
    end
    break if id > 1
  end
  puts "Yes"
  puts "1 #{ans[0]+1}"
  puts "1 #{ans[1]+1}"
else
  dp = Array.new(n).map{Array.new(200,0)}
  dp[0][0] += 1
  dp[0][moda[0]] += 1
  for i in 0..(n-2)
    for j in 0..199
      dp[i+1][j] += dp[i][j]
      dp[i+1][(j+moda[i+1])%200] += dp[i][j]
    end
  end
  dp[n-1][0] -= 1
  
  ifExist = false
  
  for i in 0..199
    if dp[n-1][i] >= 2
      ifExist = true
      break
    end
  end
  
  if ifExist
    mT = -1  # modnTwo
    id = 199
    while id >= 0
      if dp[n-1][id] >= 2
        mT = id
        break
      end
      id -= 1
    end
    
    ansa = Array.new(0)
    ansb = Array.new(0)
    id = n-1
    mTa = mTb = mT
    ifDiffer = false
    while id > 0
      if !ifDiffer
        if dp[id-1][(mTa-moda[id])%200] >= 1
          if dp[id-1][mTa] >= 1
            # puts "#{id} dif"
            ansa.unshift(id)
            ifDiffer = true
            mTa = (mTa-moda[id])%200
          else
            # puts "#{id} same"
            ansa.unshift(id)
            ansb.unshift(id)
            mTa = mTb = (mTa-moda[id])%200
          end
        end
      else
        if dp[id-1][mTa] < 1
          ansa.unshift(id)
          mTa = (mTa-moda[id])%200
        end
        if dp[id-1][(mTb-moda[id])%200] >= 1
          ansb.unshift(id)
          mTb = (mTb-moda[id])%200
        end
      end
      id -= 1
    end
    if mTa > 0
      ansa.unshift(0)
    end
    if mTb > 0 || moda[0] == 0
      ansb.unshift(0)
    end
    
    for i in 0..(ansa.length-1)
      ansa[i] += 1
    end
    for i in 0..(ansb.length-1)
      ansb[i] += 1
    end
    puts "Yes"
    puts "#{ansa.length} #{ansa.join(" ")}"
    puts "#{ansb.length} #{ansb.join(" ")}"
  else
    puts "No"
  end
end