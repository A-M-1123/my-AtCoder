T=true; F=false; INF=(1.0/0)
def putsTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def putsYN(bool);putsTF(bool,"Yes","No");end
# putsTF(bool, strT, strF) putsYN(bool)
def puts2DArray(arr,part);arr.each{|ae| puts ae.join(part)};end
# puts2DArray(arr,partition)
def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(array)
def turn2DArray(a,d,ang);d=d.downcase;return a.reverse if d=="x";return a.map(&:reverse) if d=="y";ang%=360;return nil if ang%90!=0;return a if ang==0;return turn2DArray(a,"l",90) if d=="r"&&ang==270;return turn2DArray(a,"r",90) if d=="l"&&ang==270;if ang==180;return a.reverse.map(&:reverse);elsif d=="r";return a.transpose.map(&:reverse);elsif d=="l";return a.transpose.reverse;end;return nil;end
# turn2DArray(array,dir,angle) ... dir=["x","y","l","r"], angle = 90n
def addMargin2DArray(a,c);h=a.length;w=a[0].length;i=0;while i<h;a[i].unshift(c);a[i].push(c);i+=1;end;a.unshift(Array.new(w+2,c));a.push(Array.new(w+2,c));return a;end
# addMargin2DArray(arr,char)
def trimPos2DArray(a,c);h=a.length;w=a[0].length;hRng=[0,h-1];wRng=[0,w-1];hExs=Array.new(h,F);wExs=Array.new(w,F);for i in 0..(h-1);for j in 0..(w-1);if a[i][j]==c;hExs[i]=T;wExs[j]=T;end;end;end;for i in 0..(h-1);if hExs[i];hRng[0]=i;break;end;end;for i in 0..(h-1);if hExs[h-1-i];hRng[1]=h-1-i;break;end;end;for i in 0..(w-1);if wExs[i];wRng[0]=i;break;end;end;for i in 0..(w-1);if wExs[w-1-i];wRng[1]=w-1-i;break;end;end;return[hRng,wRng];end; def trim2DArray(a,pos);hRng,wRng=pos;raH=hRng[1]-hRng[0]+1;raW=wRng[1]-wRng[0]+1;retA=Array.new(raH).map{Array.new(raW)};for i in 0..(raH-1);for j in 0..(raW-1);retA[i][j]=a[hRng[0]+i][wRng[0]+j];end;end;return retA;end
# trimPos2DArray(arr,remainMark) trim2DArray(arr,pos):pos...2*2-Array
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
# makeNds(ndN,arrL,array,1way?,wgt?,lbl?,spanning?) ex.makeNds(n,m,a,F,F,F,T)
def binsJust(a,t,n);st,en=0,n-1;while st<=en;m=(st+en)/2;return m if a[m]==t;(a[m]<k)?(st=m+1):(en=m-1);end;return false;end; def binsJustOver(a,t,n);st,en=0,n;while st<en;m=(st+en)/2;(a[m]<t)?(st=m+1):(en=m);end;return st;end; def binsOver(a,t,n);st,en=0,n;while st<en;m=(st+en)/2;(a[m]<=t)?(st=m+1):(en=m);end;return st;end
# binsJust & binsJustOver & binsOver(array,target,len)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);i=0;while i < l;r[i+1]=r[i]+a[i];i+=1;end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(array) calcPFSum(array,st,en) 0-index
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
# getDigitLen(num) getNumApart(num) ex.4275->[4,2,7,5]
def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(nu,de,mod);nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k < 1 || n <= k;nu=de=1;i=1;while i <= k;nu=nu*(n-i+1)%mod;de=de*i%mod;i+=1;end;return nu*powMod(de,mod-2,mod)%mod;end
# fracMod(nume,deno,mod) powMod(base,exp,mod) combMod(n,k,mod)
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
# g...Int Ints IntMat(n) IntVars(n)
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# g...Strs CharsDiv CharMat(n) StrsVert(n)

class PQueVector
    # default : get-Min, isAscend=false : get-Max
    def initialize(vctLen, tarIdx, *isAscend)
        @vctLen = vctLen; @tarIdx = tarIdx
        @arrLen = @len = 0
        (isAscend[0]) ? (@coef=1):(@coef=-1)
        @que = Array.new(0)
    end

    def setArray(arr)
        @que = arr
        @arrLen = arr.length; @len = @arrLen
        if @coef < 0 && 0 < @len
            i = 0
            while i < @len
                @que[i][@tarIdx] *= -1
                i += 1
            end
        end
        @que.sort!{|x,y| x[@tarIdx] <=> y[@tarIdx]}
    end

    def getCorrectedVector(vct)
        vct[@tarIdx] *= @coef
        return vct
    end
    def copyCorrectedVector(vct)
        cpyVct = Marshal.load(Marshal.dump(vct))
        return getCorrectedVector(cpyVct)
    end
    def getScalar
        (0 < @len) ? (return @que[0][@tarIdx]*@coef):(return nil)
    end
    def getVector
        (0 < @len) ? (return copyCorrectedVector(@que[0])):(return nil)
    end
    def get2ndScalar
        if @len < 2
            return nil
        elsif @len < 3
            return @que[1][@tarIdx]*@coef
        end
        l,r = @que[1][@tarIdx],@que[2][@tarIdx]
        (l <= r) ? (return l*@coef):(return r*@coef)
    end
    def get2ndVector
        if @len < 2
            return nil
        elsif @len < 3
            return copyCorrectedVector(@que[1])
        end
        l,r = @que[1][@tarIdx],@que[2][@tarIdx]
        (l <= r) ? (tarID=1):(tarID=2)
        return copyCorrectedVector(@que[tarID])
    end

    def pop
        return nil if @len < 1
        if @len == 1
            @len -= 1
            return getCorrectedVector(@que[0])
        end
        rep = @que[0]
        @que[0] = @que[@len-1]
        @len -= 1
        i = 0
        curVal = @que[i][@tarIdx]
        while true
            lid,rid = getChildrenID(i)
            break if @len <= lid
            rid = lid if @len <= rid
            lVal = @que[lid][@tarIdx]; rVal = @que[rid][@tarIdx]
            if lVal < curVal || rVal < curVal
                (lVal <= rVal) ? (swp=lid):(swp=rid)
                @que[i],@que[swp] = @que[swp],@que[i]
                i = swp
            else
                break
            end
        end
        return getCorrectedVector(rep)
    end

    def push(v)
        if @len == @arrLen
            @que.push(getCorrectedVector(v))
            @len += 1
            @arrLen += 1
        else
            @que[@len] = getCorrectedVector(v)
            @len += 1
        end
        i = @len-1
        while (pid = getParentID(i))
            if @que[i][@tarIdx] < @que[pid][@tarIdx]
                @que[i],@que[pid] = @que[pid],@que[i]
                i = pid
            else
                break
            end
        end
    end

    def getQue; return @que; end
    def getLen; return @len; end

    def getParentID(cid); (0 < cid)?(return (cid-1)/2):(return nil); end
    def getChildrenID(pid); return [pid*2+1, pid*2+2]; end
end
# PQueVector(vectorLength,targetIndex)
# setArray(arr) get/get2nd+Scalar/Vector pop push(v) getQue getLen

n,k = gInts
a = gInts

if k % 2 == 0
  ans = 0
  for i in 0..(k/2-1)
    ans += a[2*i+1]-a[2*i]
  end
  puts ans
else
  lp = Array.new(k/2,0)
  rp = Array.new(k/2,0)
  for i in 0..(k/2-1)
    lid,rid = 2*i,2*i+1
    lp[i] = lp[i-1]+a[rid]-a[lid]
    rp[i] = rp[i-1]+a[k-1-lid]-a[k-1-rid]
  end
  min = INF
  for i in (-1)..(k/2-1)
    j = (k/2-2)-i
    cmp = 0
    cmp += lp[i] if i >= 0
    cmp += rp[j] if j >= 0
    min = cmp if min > cmp
  end
  puts min
end