def combi(n,k)
    k=n-k if 2*k > n
    return 1 if k == 0
    ((n-k+1)..n).reduce(&:*)/((1..k).reduce(&:*))
  end
  
  n = gets.to_i
  
  ns = Array.new(10).map{Array.new(10).map{Array.new(0)}}
  for i in 1..9
    for j in 1..9
      ns[i][j].push(0)
    end
  end
  
  for i in 1..n
    if i % 10 != 0
      if i < 10
        ns[i][i].push(i)
        else
        s = i.to_s.split("")
        st = s[0].to_i
        en = s[-1].to_i
        ns[st][en].push(i)
      end
    end
  end
  
  cnt = 0
  for i in 1..9
    for j in i..9
      len1 = ns[i][j].length - 1
      len2 = ns[j][i].length - 1
      if len1 > 0 && len2 > 0
        if i == j
          cnt += len1*len2
        else
          cnt += len1*len2*2
        end
      end
    end
  end
  puts cnt