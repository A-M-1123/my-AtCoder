T=true; F=false
def putsTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end
# putsTF(bool, strT, strF)
def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(array)
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i+1].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(ndN,arrL,array,1way?,wgt?,lbl?,tree?) template--makeNds(n,m,a,F,F,F,F)
def bins(a,t,st,en);if st>en;puts "Err...bins: st>en";exit;end;m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m])?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# bins(array,target,0,n-1)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(array) calcPFSum(array,st,en)
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
# g...Int Ints IntMat(n) IntVars(n)
def gChars();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrs(n);n.times.map{gets.chomp};end; def gQuery(r,c,t);return[] if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# g...Chars CharsDiv CharMat(n) Strs(n) Query(row,col,[s0,i1,f2])

def castPos(pos)
  return pos+1000
end

n = gInt
xy = gIntMat(n)

width = 1000*2+1

for i in 0..(n-1)
  xy[i][0] = castPos(xy[i][0])
  xy[i][1] = castPos(xy[i][1])
end
xy.sort!
maps = Array.new(width).map{Array.new(width,-1)}
check = Array.new(n,F)

for i in 0..(n-1)
  x,y = xy[i]
  maps[y][x] = i
end

rest = n
ans = 0
id = 0
while rest > 0
  ans += 1
  queue = [xy[id]]
  len = 1
  check[id] = T
  rest -= 1
  i = 0
  while i < len
    x,y = queue[i]
    nexts = [[x-1,y-1],[x-1,y],[x,y-1],[x,y+1],[x+1,y],[x+1,y+1]]
    nexts.each do |nx|
      nxX,nxY = nx
      if 0 <= nxX && nxX < width && 0 <= nxY && nxY < width
        nxID = maps[nxY][nxX]
        if 0 <= nxID && !check[nxID]
          queue.push(xy[nxID])
          len += 1
          check[nxID] = T
          rest -= 1
        end
      end
    end
    i += 1
  end
  if rest > 0
    while check[id]
      id += 1
    end
  end
end
puts ans