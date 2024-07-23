def to2d(n, ln)
    ar = Array.new(0, ln)
    for i in 0..(ln-1)
      bit = ln-1-i
      ar[bit] = n / (2**bit)
      n -= 2**bit * ar[bit]
    end
    return ar
  end
  
  h, w, k = gets.split.map(&:to_i)
  c = h.times.map{gets.chomp.split("")}
  
  ans = 0
  for bth in 0..(2**h-1)
    bith = to2d(bth, h)
    for btw in 0..(2**w-1)
      bitw = to2d(btw, w)
      
      cnt = 0
      if bth < 2**h-1
        for i in 0..(h-1)
          if bith[i] == 0
            for j in 0..(w-1)
              cnt += 1 if bitw[j] == 0 && c[i][j] == "#"
            end
          end
        end
      end
      if cnt == k
        ans += 1
      end
    end
  end
  puts ans