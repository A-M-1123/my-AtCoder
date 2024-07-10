def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n = getInt
a = getInts

ah = Hash.new(0)
a.each{|e| ah[e] += 1}
as = Array.new(0)
ah.each do |k,v|
  as.push([k,v])
end
as.sort!{|x,y| x[0] <=> y[0]}

len = as.length
assum = Array.new(len+1,0)
assum[0] = 0
for i in 1..len
  assum[i] = assum[i-1]+as[i-1][0]*as[i-1][1]
end
for i in 1..(len-1)
  as[i][1] += as[i-1][1]
end

lost = 999999999999
for i in 0..(len-1)
  x = as[i][0]/2.0
  losti = (x*as[i][1] + (assum[len]-assum[i+1])-x*(as[len-1][1]-as[i][1])) / (n*1.0)
  lost = [lost, losti].min
end
puts lost
