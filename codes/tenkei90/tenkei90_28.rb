T=true; F=false; INF=9999999999999 # 10**13-1
def makeArrDim(*arg);len=arg.length;arr=Array.new(arg[-1],arg[0]);i=len-2;while 0<i;arr=Array.new(arg[i]).map{arr};i-=1;end;return arr;end
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(nu,de,mod);nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k < 1 || n <= k;nu=de=1;i=1;while i <= k;nu=nu*(n-i+1)%mod;de=de*i%mod;i+=1;end;return nu*powMod(de,mod-2,mod)%mod;end
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
# sort2darr(array)  <for 2*2-array>
# copyArr(array)
# p...TF(bool,strT,strF) YN(bool) 2darr(arr,partition)
# g...Int Ints IntMat(n) IntVars(n)
# g...Strs CharsDiv CharMat(n) StrsVert(n)

class PFS2d
    def initialize(a,h,w); @pfs=Array.new(h+1).map{Array.new(w+1,0)}; @w=w; @h=h; y=0; while (y+=1)<=@h; x=0; while (x+=1)<=@w; @pfs[y][x]=a[y-1][x-1]+@pfs[y][x-1]+@pfs[y-1][x]-@pfs[y-1][x-1]; end; end; end
    def calc(y1,x1,y2,x2); y1,y2=checkH(y1),checkH(y2); x1,x2=checkW(x1),checkW(x2); return @pfs[y2+1][x2+1]-@pfs[y2+1][x1]-@pfs[y1][x2+1]+@pfs[y1][x1]; end;  def checkH(y); return 0 if y<0; return @h-1 if @h-1<y; return y; end;  def checkW(x); return 0 if x<0; return @w-1 if @w-1<x; return x; end
    def getArr; return @pfs; end
end

n = gInt
len = 1000
a = Array.new(len).map{Array.new(len,0)}
for i in 1..n
  lx,ly,rx,ry = gInts
  a[ly][lx] += 1
  a[ly][rx] += -1 if rx < len
  a[ry][lx] += -1 if ry < len
  a[ry][rx] += 1 if rx < len && ry < len
end

pfs = PFS2d.new(a,len,len)
pfs = pfs.getArr
ans = Array.new(n+1,0)
for i in 1..len
  for j in 1..len
    ans[pfs[i][j]] += 1
  end
end
for i in 1..n
  puts ans[i]
end