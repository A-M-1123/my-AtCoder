def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n = getInt
a = getInts

as = Hash.new(0)
a.each{|e| as[e] += 1}

ns = Array.new(0)
as.each{|k,v| ns.push(v)}
len = ns.length

nss = Array.new(len+1,0)
for i in 0..(len-1)
  nss[i+1] = nss[i] + ns[i]
end

ans = 0
for i in 0..(len-1)
  crs = 0
  crs += nss[len]-nss[i+1] if i+2 <= len
  ans += ns[i]*crs
end
puts ans