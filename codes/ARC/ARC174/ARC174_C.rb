T=true; F=false; INF=(1.0/0)
def makeArrDim(*arg);len=arg.length;arr=Array.new(arg[-1]).map{arg[0]};i=len-2;while 0<i;arr=Array.new(arg[i]).map{arr};i-=1;end;return arr;end
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(f,mod);nu,de=f.numerator,f.denominator;nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k < 1 || n <= k;nu=de=1;i=1;while i <= k;nu=nu*(n-i+1)%mod;de=de*i%mod;i+=1;end;return nu*powMod(de,mod-2,mod)%mod;end
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

MOD = 998244353

def pEven(p) # 1 + p^2 + p^4 + ... = 1/(1-p^2)
  return 1/(1-p**2)
end
def pOdd(p) # p^1 + p^3 + p^5 + ... = p/(1-p^2)
  return p/(1-p**2)
end
def pChange(p)
  return 1/(1+p)
end

n = gInt

# pt[i][j] : i種目を引き終えた直後(i+1種目を狙うとき)にj(0=先攻/1=後攻)が手番である確率
pt = Array.new(n).map{Array.new(2).map{Rational(0,1)}} # makeArrDim(Rational(0,1),n,2)
pt[0] = 1.to_r,0.to_r

# fn[i][j] : i+1種目を狙うときのj(0=先攻/1=後攻)の罰金の期待値
fn = Array.new(n).map{Array.new(2).map{Rational(0,1)}} # makeArrDim(Rational(0,1),n,2)

for i in 1..(n-1)
  pChanged = pChange(Rational(i-1,n))
  pt[i][0] = pt[i-1][1]*pChanged + pt[i-1][0]*(1-pChanged)
  pt[i][1] = 1 - pt[i][0]
  pMiss = Rational(i,n)
  fn1st = pOdd(pMiss)
  fn2nd = fn1st*pMiss
  fn[i][0] = pt[i][0]*fn1st + pt[i][1]*fn2nd
  fn[i][1] = pt[i][1]*fn1st + pt[i][0]*fn2nd
end

fn = fn.transpose
sum1 = fn[0].sum
sum2 = fn[1].sum
puts [fracMod(sum1,MOD), fracMod(sum2,MOD)].join(" ")