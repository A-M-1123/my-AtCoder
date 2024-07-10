def getInt(); gets.to_i; end;  def getInts(); gets.split.map(&:to_i); end;  def getIntMat(n); n.times.map{gets.split.map(&:to_i)}; end;  def getIntMatVars(n); n.times.map{gets.split.map(&:to_i)}.transpose; end;  def getChars(); gets.chomp.split(""); end;  def getCharMat(n); n.times.map{gets.chomp.split("")}; end
# getInt getInts getIntMat(n) getIntMatVars(n) getChars getCharMat(n)

n = getInt
pos = getIntMat(n)

posx = Array.new(n).map{Array.new(2)}
posy = Array.new(n).map{Array.new(2)}
for i in 0..(n-1)
  posx[i] = [pos[i][0], pos[i][1], i]
  posy[i] = [pos[i][0], pos[i][1], i]
end

posx.sort!{|a,b| b[0] <=> a[0]}
posy.sort!{|a,b| b[1] <=> a[1]}

decx = Array.new(2,0)
decy = Array.new(2,0)

decx[0] = [posx[0][0]-posx[n-1][0], [posx[0][2],posx[n-1][2]].min, [posx[0][2],posx[n-1][2]].max]
if posx[0][0]-posx[n-2][0] >= posx[1][0]-posx[n-1][0]
  decx[1] = [posx[0][0]-posx[n-2][0], [posx[0][2],posx[n-2][2]].min, [posx[0][2],posx[n-2][2]].max]
else
  decx[1] = [posx[1][0]-posx[n-1][0], [posx[1][2],posx[n-1][2]].min, [posx[1][2],posx[n-1][2]].max]
end

decy[0] = [posy[0][1]-posy[n-1][1], [posy[0][2],posy[n-1][2]].min, [posy[0][2],posy[n-1][2]].max]
if posy[0][1]-posy[n-2][1] >= posy[1][1]-posy[n-1][1]
  decy[1] = [posy[0][1]-posy[n-2][1], [posy[0][2],posy[n-2][2]].min, [posy[0][2],posy[n-2][2]].max]
else
  decy[1] = [posy[1][1]-posy[n-1][1], [posy[1][2],posy[n-1][2]].min, [posy[1][2],posy[n-1][2]].max]
end

dec = Array.new(4).map{Array.new(3)}
dec[0] = decx[0]
dec[1] = decx[1]
dec[2] = decy[0]
dec[3] = decy[1]
dec.sort!{|a,b| b[0] <=> a[0]}
for i in 1..3
  if dec[i][1] != dec[0][1] || dec[i][2] != dec[0][2]
    puts dec[i][0]
    break
  end
end