def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

a,b = getInts
puts b/100.0*a