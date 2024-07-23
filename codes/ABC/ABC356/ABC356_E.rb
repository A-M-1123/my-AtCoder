T=true; F=false; INF=9999999999999 # 10**13-1
def makeArrDim(*arg);len=arg.length;arr=Array.new(arg[-1],arg[0]);i=len-2;while 0<i;arr=Array.new(arg[i]).map{arr};i-=1;end;return arr;end
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(nu,de,mod);nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k < 1 || n <= k;nu=de=1;i=1;while i <= k;nu=nu*(n-i+1)%mod;de=de*i%mod;i+=1;end;return nu*powMod(de,mod-2,mod)%mod;end
def to1d(y,x,w); return y*w+x; end;  def to2d(n,w); return (n / w),(n % w); end
def sort2darr(a);a.sort!{|x,y|(x[0]<=>y[0]).nonzero?||x[1]<=>y[1]};end
def copyArr(a);return Marshal.load(Marshal.dump(a));end
def pTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def pYN(bool);pTF(bool,"Yes","No");end
def p2darr(arr,part);arr.each{|ae| puts ae.join(part)};end
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# makeArrDim(val,*dim)
# makeNds(ndN,edgeN,edgeArr,1way?,wgt?,lbl?,spanning?)  <ex.makeNds(n,m,a,F,F,F,T)>
# getDigitLen(num) getNumApart(num)  <ex.4275=>[4,2,7,5]>
# fracMod(nume,deno,mod) powMod(base,exp,mod) combMod(n,k,mod)
# to1d(y,x,w) to2d(n,w) <w = width>
# sort2darr(array)  <for 2*2-array>
# copyArr(array)
# p...TF(bool,strT,strF) YN(bool) 2darr(arr,partition)
# g...Int Ints IntMat(n) IntVars(n)
# g...Strs CharsDiv CharMat(n) StrsVert(n)

def sumto(n)
  return n*(n+1)/2
end

class PFS
    def initialize(a); @len=a.length; @pfs=Array.new(@len+1,0); i=-1; while(i+=1)<@len; @pfs[i+1]=@pfs[i]+a[i]; end; end
    def calc(l,r); l=check(l); r=check(r); return 0 if l>r; return @pfs[r+1]-@pfs[l]; end;  def check(i); return 0 if i<0; return @len-1 if @len<=i; return i; end
end

n = gInt
a = gInts

a.sort!
maxA = a.max
sumA = a.sum

cnt = Array.new(maxA+1,0)
i = 0-1
while (i += 1) < n
  cnt[a[i]] += 1
end
a.uniq!
n = a.length

pfs = PFS.new(cnt)
ans = 0
i = 0-1
while (i += 1) < n
  curA = a[i]
  cntA = cnt[curA]
  if curA == 1
    ans += cntA*sumA
    ans -= sumto(cntA)
  else
    maxJ = maxA/curA
    j = 0
    while (j += 1) < maxJ
      res = pfs.calc(curA*j,curA*(j+1)-1)
      ans += cntA*res*j
    end
    ans += cntA*(pfs.calc(curA*j,maxA))*j
    ans -= sumto(cntA)
  end
end
puts ans