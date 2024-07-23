def fac(num)
    return [0] if num < 2
    ans = Array.new(0)
    tmp = num
    for div in 2..(10**6)
      while tmp % div == 0
        ans.push(div)
        tmp /= div
      end
      break if tmp == 1
    end
    ans.push(tmp) if tmp > 1
    return ans
  end
  
  n = gets.to_i
  
  a = fac(n)
  fs = Hash.new(0)
  a.each{|e| fs[e] += 1}
  
  ans = 0
  fs.each do |k,v|
    val = v
    cnt = 1
    while val-cnt >= cnt+1
      val -= cnt
      cnt += 1
      ans += 1
    end
    ans += 1 if val > 0
  end
  if n > 1
    puts ans
  else
    puts 0
  end