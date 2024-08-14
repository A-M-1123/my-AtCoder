T=true; F=false; INF=9999999999999 # 10**13-1
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
def to1d(y,x,w); return y*w+x; end;  def to2d(n,w); return (n / w),(n % w); end
def nC2(n); return 0 if n<2; return n*(n-1)/2; end;  def sumStep(n); return 0 if n<1; return n*(n+1)/2; end;  def count0011(w,i); blc = n/(w << 1); ret = blc*w; n -= blc*(w << 1)+w-1; ret+=n if 0<n; return ret; end
def sort2darr(a);a.sort!{|x,y|(x[0]<=>y[0]).nonzero?||x[1]<=>y[1]};end
def copyArr(a);return Marshal.load(Marshal.dump(a));end
def pTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def pYN(bool);pTF(bool,"Yes","No");end
def p2darr(arr,part);arr.each{|ae| puts ae.join(part)};end
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# makeNds(ndN,edgeN,edgeArr,1way?,wgt?,lbl?,spanning?) <ex.makeNds(n,m,a,F,F,F,T)>
# getDigitLen(num) # getNumApart(num) <ex.4275=>[4,2,7,5]>
# to1d(y,x,w) to2d(n,w) <w = width>
# nCn(n) # sumStep(n) <sum(1..n)> # count0011(w,i) <0-index>
# sort2darr(array) <for 2*2-array>
# copyArr(array)
# p...TF(bool,strT,strF) YN(bool) 2darr(arr,partition)
# g...Int Ints IntMat(n) IntVars(n)
# g...Strs CharsDiv CharMat(n) StrsVert(n)

def pfs3d(array)
  d1, d2, d3 = array.size, array[0].size, array[0][0].size

  pfs = Array.new(d1 + 1) { Array.new(d2 + 1) { Array.new(d3 + 1, 0) } }

  (1..d1).each do |i|
    (1..d2).each do |j|
      (1..d3).each do |k|
        pfs[i][j][k] = array[i-1][j-1][k-1]
        pfs[i][j][k] += pfs[i-1][j][k] if i > 1
        pfs[i][j][k] += pfs[i][j-1][k] if j > 1
        pfs[i][j][k] += pfs[i][j][k-1] if k > 1
        pfs[i][j][k] -= pfs[i-1][j-1][k] if i > 1 && j > 1
        pfs[i][j][k] -= pfs[i-1][j][k-1] if i > 1 && k > 1
        pfs[i][j][k] -= pfs[i][j-1][k-1] if j > 1 && k > 1
        pfs[i][j][k] += pfs[i-1][j-1][k-1] if i > 1 && j > 1 && k > 1
      end
    end
  end

  return pfs
end

def calcPfs3d(pfs, x1, y1, z1, x2, y2, z2)
  sum = pfs[x2][y2][z2]
  sum -= pfs[x1-1][y2][z2] if x1 > 1
  sum -= pfs[x2][y1-1][z2] if y1 > 1
  sum -= pfs[x2][y2][z1-1] if z1 > 1
  sum += pfs[x1-1][y1-1][z2] if x1 > 1 && y1 > 1
  sum += pfs[x1-1][y2][z1-1] if x1 > 1 && z1 > 1
  sum += pfs[x2][y1-1][z1-1] if y1 > 1 && z1 > 1
  sum -= pfs[x1-1][y1-1][z1-1] if x1 > 1 && y1 > 1 && z1 > 1
  
  return sum
end

n = gInt
a = Array.new(n).map{Array.new(n).map{Array.new(n)}}
for i in 0..(n-1)
  for j in 0..(n-1)
    line = gInts
    a[i][j] = line
  end
end
q = gInt

pfs = pfs3d(a)

i = 0
while (i += 1) <= q
  x1,x2,y1,y2,z1,z2 = gInts
  puts calcPfs3d(pfs,x1,y1,z1,x2,y2,z2)
end