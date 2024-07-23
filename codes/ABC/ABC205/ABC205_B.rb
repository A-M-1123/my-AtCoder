def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n = getInt
a = getInts

cnt = Array.new(n+1,0)
a.each{|e| cnt[e] += 1}

flag = 1
for i in 1..n
  if cnt[i] != 1
    flag = 0
    break
  end
end
(flag == 1) ? (puts "Yes"):(puts "No")