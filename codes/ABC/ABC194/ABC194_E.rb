n,m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

amax = 0
amin = 10**8
for i in 0..(n-1)
  amax = [amax, a[i]].max
  amin = [amin, a[i]].min
end

if amin > 0
  puts 0
else
  ns = Array.new(amax+1).map{Array.new(0)}
  nln = Array.new(amax+1,0)

  for i in 0..amax
    ns[i].push(-1)
  end
  for i in 0..(n-1)
    ns[a[i]].push(i)
    nln[a[i]] += 1
  end
  for i in 0..amax
    ns[i].push(n)
  end

  ans = -1
  for i in 0..amax
    if nln[i] > 0
      for j in 1..(nln[i]+1)
        if ns[i][j]-ns[i][j-1] > m
          ans = i
          break
        end
      end
    end
  end
  (ans >= 0) ? (puts ans):(puts amax+1)
end
