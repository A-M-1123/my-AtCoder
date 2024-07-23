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

class PQueDel
    def initialize(*isAscend); @arrLen=@len=0; (isAscend.empty? || isAscend[0])?(@coef=1):(@coef=-1); @que=[]; @amount=Hash.new(0); @delRest=Hash.new(0); end
    def setArray(arr); return if arr.empty?; @arrLen=arr.length; @len=@arrLen; i=-1; while (i+=1)<@len; @que << arr[i]*@coef; @amount[arr[i]*@coef]+=1; end; @que.sort!; end

    def get; return @que[0]*@coef if 0<@len; return nil; end
    def pop; ret=calcPop(); clean(); return ret; end;  def calcPop; return nil if @len<1; ret=@que[0]; @amount[ret]-=1; @que[0]=@que[@len-1]; @que[@len-1] = -INF; return ret*@coef if (@len-=1)<1; i=0; while true; lid,rid=i*2+1,i*2+2; break if @len<=lid; rid=lid if @len<=rid; if @que[lid]<@que[i] || @que[rid]<@que[i]; (@que[lid]<=@que[rid])?(swp=lid):(swp=rid); @que[i],@que[swp]=@que[swp],@que[i]; i=swp; else; break; end; end; return ret*@coef; end
    def push(v); v*=@coef; if @len==@arrLen; @que << v; @len+=1; @arrLen+=1; else; @que[@len]=v; @len+=1; end; @amount[v]+=1; i=@len-1; while (pid=getParentID(i)); if @que[i]<@que[pid]; @que[i],@que[pid]=@que[pid],@que[i]; i=pid; else; break; end; end; end
    def delete(v,k); return if @len<1; v*=@coef; delMax=@amount[v]; if @delRest[v]+k<delMax; @delRest[v]+=k; else; @delRest[v]=delMax; end; clean(); end
    def getQue; return @que; end
    def getLen; return @len; end;  def clean(); while 0<@delRest[@que[0]]; @delRest[@que[0]]-=1; calcPop(); end; end;  def getParentID(cid); return (cid-1)/2 if 0<cid; return nil; end
end


q = gInt

pqMin = PQueDel.new()
pqMax = PQueDel.new(F)

i = 0
while (i += 1) <= q
  line = gInts
  if line[0] == 1
    cmd,x = line
    pqMin.push(x)
    pqMax.push(x)
  elsif line[0] == 2
    cmd,x,c = line
    pqMin.delete(x,c)
    pqMax.delete(x,c)
  elsif line[0] == 3
    puts pqMax.get - pqMin.get
  end
end