INF = 99999999
def to2d(n, ln)
  ar = Array.new(ln)
  for i in 0..(ln-1)
    ar[i] = n / (2**(ln-1-i))
    n -= ar[i]*(2**(ln-1-i))
  end
  return ar.reverse
end

h, w, k = gets.split.map(&:to_i)
c = h.times.map{gets.chomp.split("").map(&:to_i)}

cs = Array.new(h).map{Array.new(w+1,0)}
for i in 0..(h-1)
  for j in 0..(w-1)
    cs[i][j+1] = cs[i][j] + c[i][j]
  end
end

ans = INF
for div in 0..(2**(h-1)-1)
  sep = to2d(div, h-1)
  cnt = 0
  sep.each{|sp| cnt += sp}
  st = 1
  en = 1
  while en <= w
    sum = 0
    for rw in 0..(h-1)
      sum += cs[rw][en] - cs[rw][st-1]
      if sep[rw] == 1 || rw == h-1
        if sum > k
          if st < en
            cnt += 1
            st = en
            break
          else
            cnt = INF
            break
          end
        elsif rw == h-1
          en += 1
        end
        sum = 0
      end
    end
    break if cnt >= INF
  end
  ans = [ans,cnt].min
end
puts ans