def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n,m = getInts
a,b = getIntMatVars(m)

nds = Array.new(n+1).map{Array.new(0)}
for i in 0..(m-1)
  nds[a[i]].push(b[i])
end
for i in 1..n
  nds[i].push(-1)
end

ans = 0
fid = 1
while fid <= n
  ckd = Array.new(n+1,0)
  ids = [fid]
  ckd[fid] = 1
  len = 1
  i = 0
  while i < len
    nds[ids[i]].each do |e|
      if e > 0 && ckd[e] == 0
        ids.push(e)
        ckd[e] = 1
        len += 1
      end
    end
    i += 1
  end
  ans += len
  fid += 1
end

puts ans
