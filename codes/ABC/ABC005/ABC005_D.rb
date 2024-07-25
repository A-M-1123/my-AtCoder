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

class PFS2d
    def initialize(a,h,w); @pfs=Array.new(h+1).map{Array.new(w+1,0)}; @w=w; @h=h; y=0; while (y+=1)<=@h; x=0; while (x+=1)<=@w; @pfs[y][x]=a[y-1][x-1]+@pfs[y][x-1]+@pfs[y-1][x]-@pfs[y-1][x-1]; end; end; end
    def calc(y1,x1,y2,x2); y1,y2=checkH(y1),checkH(y2); x1,x2=checkW(x1),checkW(x2); return @pfs[y2+1][x2+1]-@pfs[y2+1][x1]-@pfs[y1][x2+1]+@pfs[y1][x1]; end;  def checkH(y); return 0 if y<0; return @h-1 if @h-1<y; return y; end;  def checkW(x); return 0 if x<0; return @w-1 if @w-1<x; return x; end
end


n = gInt
d = gIntMat(n)
q = gInt

pfs = PFS2d.new(d,n,n)
ans = Array.new(n**2+1,0)
stY = -1
while (stY += 1) < n
  maxH = n-stY
  stX = -1
  while (stX += 1) < n
    maxW = n-stX
    h = 0
    while (h += 1) <= maxH
      w = 0
      while (w += 1) <= maxW
        sum = pfs.calc(stY,stX,stY+h-1,stX+w-1)
        ans[h*w] = [ans[h*w],sum].max
      end
    end
  end
end

for i in 1..(n**2)
  ans[i] = [ans[i], ans[i-1]].max
end

for i in 1..q
  p = gInt
  puts ans[p]
end