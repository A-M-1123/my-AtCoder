def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n,k = getInts
a = getIntMat(n)

ans = 10**12
for i in 0..(n-k)
  ar = Array.new(0)
  for j in 0..(k-1)
    for l in i..(i+k-1)
      ar.push(a[j][l])
    end
  end
  for j in 0..(n-k)
    if j > 0
      k.times.map{ar.shift}
      for l in i..(i+k-1)
        ar.push(a[k-1+j][l])
      end
    end
    
    sorted = (Marshal.load(Marshal.dump(ar))).sort!{|x,y| y <=> x}

    ans = [ans, sorted[k**2/2]].min
  end
end
puts ans