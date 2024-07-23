def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n,q = getInts
a = getInts
k = Array.new(q)
for i in 0..(q-1)
  k[i] = getInt
end

ks = Marshal.load(Marshal.dump(k))
ks.sort!
kh = Hash.new(0)

kid = 0
while kid < q && ks[kid] < a[0]
  kh[ks[kid]] += ks[kid]
  kid += 1
end
for i in 0..(n-2)
  while kid < q && a[i] < ks[kid]+i+1 && ks[kid]+i+1 < a[i+1]
    kh[ks[kid]] += ks[kid]+i+1
    kid += 1
  end
end
while kid < q
  kh[ks[kid]] += ks[kid]+n
  kid += 1
end

for i in 0..(q-1)
  puts kh[k[i]]
end