def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

s = getChars

len = s.length
ans = Array.new(len)
for i in 0..(len-1)
  if s[i] == "6"
    ans[len-i-1] = "9"
  elsif s[i] == "9"
    ans[len-i-1] = "6"
  else
    ans[len-i-1] = s[i]
  end
end
puts ans.join