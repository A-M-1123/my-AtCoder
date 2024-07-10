def func(n)
    ar = []
    for i in 2..n
      while n % i == 0
        ar.push(i)
        n /= i
      end
      break if n == 1
    end
    return ar
  end
  
  n = gets.to_i
  
  el = Array.new(n+1).map{Array.new(n+1,0)}
  for i in 2..n
    a = func(i)
    a.each do |e|
      el[i][e] += 1
    end
  end
  
  ansel = Array.new(n+1,0)
  for i in 2..n
    #puts "#{i}: #{el[i].join(" ")}"
    for j in 2..n
      ansel[j] = [ansel[j], el[i][j]].max
    end
  end
  ans = 1
  for i in 2..n
    ans *= i**ansel[i]
  end
  tmp = ans
  #while ans < n
  #  ans *= tmp
  #end
  puts ans+1