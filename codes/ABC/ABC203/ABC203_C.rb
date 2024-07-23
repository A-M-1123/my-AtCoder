def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n,k = getInts
a = getIntMat(n)

a.sort!{|x,y| x[0] <=> y[0]}

prev = 0
ans = 0
i = 0
while i < n
  if a[i][0]-prev > k
    break
  end
  k -= a[i][0]-prev
  ans = a[i][0]
  prev = a[i][0]
  k += a[i][1]
  while i < n-1 && a[i][0] == a[i+1][0]
    i += 1
    k += a[i][1]
  end
  i += 1
end
ans += k if k > 0
ans = 10**100 if ans > 10**100
puts ans