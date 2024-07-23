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

class PQue
    def initialize(*isAscend); @arrLen=@len=0; (isAscend.empty?||isAscend[0])?(@coef=1):(@coef=-1); @que=[]; end
    def setArray(arr); return if arr.empty?; @que=Marshal.load(Marshal.dump(arr)); @arrLen=arr.length; @len=@arrLen; if @coef<0; i=-1; while (i+=1)<@len; @que[i]*=-1; end; end; @que.sort!; end

    def pop; return nil if @len<1; res=@que[0]; @que[0]=@que[@len-1]; @que[@len-1]=-INF; return res*@coef if (@len-=1)<1; i=0; while true; lid,rid=i*2+1,i*2+2; break if @len<=lid; rid=lid if @len<=rid; if @que[lid]<@que[i] || @que[rid]<@que[i]; (@que[lid] <= @que[rid])?(swp=lid):(swp=rid); @que[i],@que[swp]=@que[swp],@que[i]; i=swp; else; break; end; end; return res*@coef; end
    def push(v); if @len==@arrLen; @que << v*@coef; @len+=1; @arrLen+=1; else; @que[@len]=v*@coef; @len+=1; end; i=@len-1; while (pid=getParentID(i)); if @que[i]<@que[pid]; @que[i],@que[pid]=@que[pid],@que[i]; i=pid; else; break; end; end; end
    def get; return @que[0]*@coef if 0<@len; return nil; end
    def get2nd; if @len<2; return nil; elsif @len<3; return @que[1]*@coef; else; l,r=@que[1],@que[2]; (l<=r)?(return l*@coef):(return r*@coef); end; end
    def getQue; return @que; end
    def getLen; return @len; end;  def getParentID(cid); return (cid-1) / 2 if 0 < cid; return nil; end
end

class PQueSum
    def initialize(arr,*isAscend)
        (isAscend.empty?||isAscend[0]) ? (asc=true):(asc=false)
        @que = PQue.new(asc); @que.setArray(arr)
        @del = PQue.new(asc)
        @sum = arr.sum
        @len = arr.length
    end
    
    def push(v)
        @que.push(v) if !offsetDel(v)
        @sum += v
        @len += 1
    end
    
    def pop()
        ret = @que.pop()
        cleanQue()
        @sum -= ret
        @len -= 1
        return ret
    end
    
    def remove(v)
        if @que.get == v
            return pop()
        else
            @del.push(v)
            @sum -= v
            @len -= 1
        end
    end
    
    def get()
        return @que.get()
    end
    
    def sum()
        return @sum
    end
    
    def offsetDel(v)
        if @del.get() == v
            @del.pop()
            return true
        end
        return false
    end
    def cleanQue()
        delTop = @del.get()
        while delTop && delTop == @que.get()
            @del.pop()
            @que.pop()
            delTop = @del.get()
        end
    end
end

n,m,k = gInts
a = gInts

if k == m
  ans = []
  sum = a[0..(m-1)].sum
  ans << sum
  i = 0-1
  while (i += 1) < n-m
    sum = sum - a[i] + a[i+m]
    ans << sum
  end
  puts ans.join(' ')
  exit
end

tmp = copyArr(a[0..(m-1)])
tmp.sort!
iss = []
nos = []
i = 0-1
while (i += 1) < m
  if i < k
    iss << tmp[i]
  else
    nos << tmp[i]
  end
end

isK = PQueSum.new(iss,F)
noK = PQueSum.new(nos)

ans = []
ans << iss.sum
i = 0-1
while (i += 1) < n-m
  outN = a[i]
  inN = a[i+m]
  isTop = isK.get
  noTop = noK.get
  if outN <= isTop && inN <= isTop
    isK.remove(outN)
    isK.push(inN)
  elsif noTop <= outN && noTop <= inN
    noK.remove(outN)
    noK.push(inN)
  elsif outN <= isTop && noTop <= inN
    isK.remove(outN)
    isK.push(noK.pop)
    noK.push(inN)
  else
    noK.remove(outN)
    noK.push(isK.pop)
    isK.push(inN)
  end
  ans << isK.sum
end
puts ans.join(' ')