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

class PQueVector
    def initialize(vctLen,tarIdx,*isAscend); @vctLen=vctLen; @tarIdx=tarIdx; @arrLen=@len=0; (isAscend.empty?||isAscend[0])?(@coef=1):(@coef=-1); @que=[]; end
    def setArray(arr); return if arr.empty?; @que=Marshal.load(Marshal.dump(arr)); @arrLen=arr.length; @len=@arrLen; if @coef<0; i=-1; while (i+=1)<@len; @que[i][@tarIdx]*=-1; end; end; @que.sort_by!{|v|v[@tarIdx]}; end

    def pop; return nil if @len<1; if @len==1; @len-=1; return getCorrectedVector(@que[0]); end; res=@que[0]; @que[0]=@que[@len-1]; @len-=1; i=0; curVal=@que[i][@tarIdx]; while true; lid,rid=i*2+1,i*2+2; break if @len<=lid; rid=lid if @len<=rid; lVal=@que[lid][@tarIdx]; rVal=@que[rid][@tarIdx]; if lVal<curVal || rVal<curVal; (lVal<=rVal)?(swp=lid):(swp=rid); @que[i],@que[swp]=@que[swp],@que[i]; i=swp; else; break; end; end; return getCorrectedVector(res); end
    def push(v); if @len==@arrLen; @que << getCorrectedVector(v); @len+=1; @arrLen+=1; else; @que[@len]=getCorrectedVector(v); @len+=1; end; i=@len-1; while (pid=getParentID(i)); if @que[i][@tarIdx]<@que[pid][@tarIdx]; @que[i],@que[pid]=@que[pid],@que[i]; i=pid; else; break; end; end; end
    def getScalar; (0<@len)?(return @que[0][@tarIdx]*@coef):(return nil); end
    def getVector; (0<@len)?(return copyCorrectedVector(@que[0])):(return nil); end
    def get2ndScalar; if @len<2; return nil; elsif @len<3; return @que[1][@tarIdx]*@coef; end; l,r=@que[1][@tarIdx],@que[2][@tarIdx]; (l<=r)?(return l*@coef):(return r*@coef); end
    def get2ndVector; if @len<2; return nil; elsif @len<3; return copyCorrectedVector(@que[1]); end; l,r=@que[1][@tarIdx],@que[2][@tarIdx]; (l<=r)?(tarID=1):(tarID=2); return copyCorrectedVector(@que[tarID]); end
    def getQue; return @que; end
    def getLen; return @len; end;  def getCorrectedVector(vct); vct[@tarIdx]*=@coef; return vct; end;  def copyCorrectedVector(vct); cpyVct=Marshal.load(Marshal.dump(vct)); return getCorrectedVector(cpyVct); end;  def getParentID(cid); (0 < cid)?(return (cid-1)/2):(return nil); end
end

n,k = gInts
p = gInts

if k == 1
  puts 0
  exit
end

pos = Array.new(n+1,0)
i = -1
while (i += 1) < n
  pos[p[i]] = i+1
end

pqMin = PQueVector.new(2,1)
pqMax = PQueVector.new(2,1,F)

st = 0
max = pos[1..k].max
min = pos[1..k].min
ans = max-min
i = 0
while (i += 1) <= k
  pqMin.push([i,pos[i]])
  pqMax.push([i,pos[i]])
end

i = 1
while (i += 1) <= n-k+1
  pre = pos[i-1]
  max = pqMax.getScalar
  min = pqMin.getScalar
  if pre == max
    pqMax.pop
  elsif pre == min
    pqMin.pop
  end
  nxt = i+k-1
  pqMax.push([nxt,pos[nxt]])
  pqMin.push([nxt,pos[nxt]])
  while (pqMax.getVector)[0] < i
    pqMax.pop
  end
  while (pqMin.getVector)[0] < i
    pqMin.pop
  end
  ans = [ans, pqMax.getScalar - pqMin.getScalar].min
end
puts ans