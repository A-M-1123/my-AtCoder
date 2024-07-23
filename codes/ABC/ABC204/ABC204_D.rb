def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n = getInt
t = getInts

tsum = 0
t.each do |e|
  tsum += e
end

ts = Array.new(tsum+1,0)
ts[0] = 1
ts[t[0]] = 1
tmax = t[0]
for i in 1..(n-1)
  j = tmax
  while j >= 0
    if ts[j] == 1
      ts[j+t[i]] = 1
    end
    j -= 1
  end
  tmax += t[i]
end

mid = tsum/2.0
ans = [99999999, 99999999.0]
for i in 0..tsum
  if ts[i] == 1
    d = (i*1.0-mid).abs
    if ans[1] > d
      ans = [i, d]
      #puts i
    end
  end
end
puts [ans[0], tsum-ans[0]].max