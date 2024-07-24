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

class IdCompless
    def initialize(vs); @vs=vs.sort.uniq; @vLen=vs.length; @hs=Hash.new(0); i=-1; while (i+=1)<@vLen; @hs[@vs[i]]=i; end; end
    def val(id); return @vs[id]; end
    def id(v); return @hs[v]; end
    def getIds(vArr); ids=Array.new(vArr.length); i=-1; while (i+=1)<vArr.length; ids[i]=@hs[vArr[i]]; end; return ids; end
    def getVals(); return @vs; end
    def getLength(); return @vLen; end
end

class PFS
    def initialize(a); @len=a.length; @pfs=Array.new(@len+1,0); i=-1; while(i+=1)<@len; @pfs[i+1]=@pfs[i]+a[i]; end; end
    def calc(l,r); l=check(l); r=check(r); return 0 if l>r; return @pfs[r+1]-@pfs[l]; end;  def check(i); return 0 if i<0; return @len-1 if @len<=i; return i; end
end

n = gInt
s = gCharsDiv
w = gInts

idc = IdCompless.new(w)
len = idc.getLength

ch = Array.new(len,0)
ad = Array.new(len,0)
for i in 0..(n-1)
  if s[i] == '0'
    ch[idc.id(w[i])] += 1
  else
    ad[idc.id(w[i])] += 1
  end
end
chPfs = PFS.new(ch)
adPfs = PFS.new(ad)

ans = adPfs.calc(0,len-1)
for i in 0..(len-2)
  tmp = chPfs.calc(0,i) + adPfs.calc(i+1,len-1)
  ans = [ans,tmp].max
end
ans = [ans,chPfs.calc(0,len-1)].max

puts ans