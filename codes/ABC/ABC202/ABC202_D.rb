def modpow(a, n, mod)
    exp = Math.log(n, 2).floor
    rep = modpow_cl(a, n, exp, mod)
    return rep[0]
  end
  
  def modpow_cl(a, n, exp, mod)
    if exp < 0
      rep = [1, a]
    else
      if n >= 2**exp
        rep = modpow_cl(a, n-2**exp, exp-1, mod)
        rep[0] = rep[0]*rep[1] % mod
      else
        rep = modpow_cl(a, n, exp-1, mod)
      end
      rep[1] = rep[1]**2 % mod
    end
    return rep
  end
  
  def modcomb(n, k, mod)
    return 0 if n < 1
    return 1 if k < 1 || n <= k
    nume = deno = 1
    for i in 1..k
      nume = nume*(n-i+1) % mod
      deno = deno*i % mod
    end
    return nume*modpow(deno, mod-2, mod) % mod
  end
  
  def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
  # getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)
  
  INF = 1000000000000000000000007
  
  def solve(a,b,k,ord,ans)
    # puts "a:#{a}, b:#{b}, ord:#{ord}"
    if ord == k || a <= 0 || b <= 0
      a.times.map{ans.push("a")}
      b.times.map{ans.push("b")}
      return ans
    end
    
    aord = Array.new(a+1,0)
    aord[0] = ord
    for i in 1..a
      addn = modcomb(b-1+(i-1),(i-1),INF)
      addn = 1 if addn < 1 && b == 1
      aord[i] = aord[i-1] + addn
    end
    # puts aord.join(" ")
    for i in 0..(a-1)
      if aord[i] <= k && k < aord[i+1]
        (a-i).times.map{ans.push("a")}
        ans.push("b")
        return solve(i,b-1,k,aord[i],ans)
      end
    end
    ans.push("b")
    return solve(a,b-1,k,aord[a],ans)
  end
  
  a,b,k = getInts
  
  ans = Array.new(0)
  puts solve(a,b,k-1,0,ans).join