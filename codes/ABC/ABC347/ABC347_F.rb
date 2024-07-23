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
  def initialize(a,h,w)
    @pfs = Array.new(h+1).map{Array.new(w+1,0)}
    @w = w; @h = h
    setup(a)
  end
  def setup(a)
    for y in 1..@h
      for x in 1..@w
        @pfs[y][x] = a[y-1][x-1] + @pfs[y][x-1] + @pfs[y-1][x] - @pfs[y-1][x-1]
      end
    end
  end
  def calc(y1,x1,y2,x2)
    return @pfs[y2+1][x2+1] - @pfs[y2+1][x1] - @pfs[y1][x2+1] + @pfs[y1][x1]
  end
end

n,m = gInts
a = gIntMat(n)

ap = Array.new(n).map{Array.new(n)}
pf = PFS2d.new(a,n,n)

dp = Array.new(n+1).map{Array.new(n+1).map{Array.new(4,0)}}
for y in 0..n
  for x in 0..n
    for i in 1..3
      dp[y][x][i] = dp[y-1][x][i] if 0 <= y-1 && dp[y][x][i] < dp[y-1][x][i]
      dp[y][x][i] = dp[y][x-1][i] if 0 <= x-1 && dp[y][x][i] < dp[y][x-1][i]
    end
    if y <= n-m && x <= n-m
      id = y+m
      pt = pf.calc(y,x,id-1,id-1)
      for i in 0..2
        dp[y][id][i+1] = dp[y][x][i] + pt if dp[y][id][i+1] < dp[y][x][i] + pt
        dp[id][0][i+1] = dp[y][x][i] + pt if dp[id][0][i+1] < dp[y][x][i] + pt
      end
    end
  end
end
max = 0
for y in 0..n
  for x in 0..n
    max = [dp[y][x][3],max].max
  end
end
puts max