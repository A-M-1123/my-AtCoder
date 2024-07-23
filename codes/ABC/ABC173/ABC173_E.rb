MOD = 10**9 + 7
n, k = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

flag = 1
a.each do |ae|
  if ae > 0
    flag = 0
    break
  end
end

ans = 1
if flag == 1 && k % 2 == 1
  a.sort!{|x,y| y<=>x}
  for i in 0..(k-1)
    (ans * a[i] < 0) ? (mag = -1):(mag = 1)
    ans = (ans * a[i]).abs % MOD
    ans *= mag
  end
  puts ans % MOD
else
  a.sort!{|x,y| y.abs<=>x.abs}
  cnt = 0
  for i in 0..(k-1)
    cnt += 1 if a[i] < 0
  end
  if a[k-1] == 0
    puts 0
  elsif cnt % 2 == 0 || n == k
    for i in 0..(k-1)
      (ans * a[i] < 0) ? (mag = -1):(mag = 1)
      ans = (ans * a[i]).abs % MOD
      ans *= mag
    end
    puts ans % MOD
  else
    idbef = idaft = -1
    befp = befm = aftp = aftm = -1
    for i in 0..(k-1)
      id = k-1-i
      befp = id if befp == -1 && a[id] >= 0
      befm = id if befm == -1 && a[id] < 0
      break if befp >= 0 && befm >= 0
    end
    for id in k..(n-1)
      aftp = id if aftp == -1 && a[id] >= 0
      aftm = id if aftm == -1 && a[id] < 0
      break if aftp >= 0 && aftm >= 0
    end
    
    if befp < 0 || aftm < 0
      idbef = befm
      idaft = aftp
    elsif befm < 0 || aftp < 0
      idbef = befp
      idaft = aftm
    else
      if (a[aftp]*a[befp]).abs >= (a[aftm]*a[befm]).abs
        idbef = befm
        idaft = aftp
      else
        idbef = befp
        idaft = aftm
      end
    end
    
    for i in 0..(k-1)
      if i != idbef
        (ans * a[i] < 0) ? (mag = -1):(mag = 1)
        ans = (ans * a[i]).abs % MOD
        ans *= mag
      end
    end
    (ans * a[idaft] < 0) ? (mag = -1):(mag = 1)
    ans = (ans * a[idaft]).abs % MOD
    ans *= mag
    puts ans % MOD
  end
end