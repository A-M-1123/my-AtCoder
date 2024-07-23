def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n = getInt
a = getInts
b = getInts
c = getInts

cid = Array.new(n+1,0)
c.each{|e| cid[e] += 1}
anum = Array.new(n+1,0)
bnum = Array.new(n+1,0)
for i in 0..(n-1)
  anum[a[i]] += 1
end
for i in 1..n
  if cid[i] > 0
    bnum[b[i-1]] += cid[i]
  end
end

ans = 0
for i in 1..n
  if anum[i]*bnum[i] > 0
    ans += anum[i]*bnum[i]
  end
end
puts ans