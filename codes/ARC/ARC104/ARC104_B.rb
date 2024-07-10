n,s = gets.chomp.split
n = n.to_i
s = s.split("")

sym = ["A", "T", "C", "G"]

sums = Array.new(4).map{Array.new(n+1,0)}
for i in 0..(n-1)
  for j in 0..3
    if s[i] == sym[j]
      sums[j][i+1] = sums[j][i] + 1
    else
      sums[j][i+1] = sums[j][i]
    end
  end
end

ans = 0
st = 0
for st in 0..(n-1)
  en = st+1
  while en < n
    if sums[0][en+1]-sums[0][st] == sums[1][en+1]-sums[1][st] && sums[2][en+1]-sums[2][st] == sums[3][en+1]-sums[3][st]
      ans += 1
    end
    en += 2
  end
end
puts ans