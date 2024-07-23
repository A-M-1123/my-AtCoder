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

class LazySegTreeSum
    def initialize(arr)
        @defVal = 0  # sum
        @arrLen = arr.length
        @trBtmLen = calcBottomLength(@arrLen)
        @trLen = @trBtmLen*2 - 1
        @trBtmStID = @trBtmLen-1
        @trBtmEnID = @trBtmStID+@arrLen-1
        @trDepth = calcDepth(@trBtmStID)
        @tree = initTree(arr)
        @lazy = Array.new(@trBtmStID,@defVal)
        @rngs = initRanges()
        setup(@tree,@rngs)
    end

    def initTree(arr)
        tr = Array.new(@trLen,@defVal)
        i = 0
        while i < @arrLen
            tr[i+@trBtmStID] = arr[i]
            i += 1
        end
        return tr
    end
    def initRanges()
        rng = Array.new(@trLen).map{Array.new(2)}
        i = @trBtmStID
        while i < @trLen
            rng[i][0],rng[i][1] = i-@trBtmStID,i-@trBtmStID
            i += 1
        end
        return rng
    end
    def setup(tr,rg)
        return if @trBtmLen <= 1
        dep = @trDepth-1
        while 0 <= dep
            i = 0
            stID = calcTopIDByDepth(dep)
            while i < 2**dep
                lid,rid = (stID+i)*2+1,(stID+i)*2+2
                tr[stID+i] = tr[lid] + tr[rid]  # sum
                rg[stID+i][0],rg[stID+i][1] = rg[lid][0],rg[rid][1]
                i += 1
            end
            dep -= 1
        end
    end

    def evalAll()
        i = 0
        while i < @trBtmStID
            eval(i) if @lazy[i] != @defVal
            i += 1
        end
    end
    def eval(id)
        return if @lazy[id] == @defVal
        if id < @trBtmStID
            lid,rid = id*2+1,id*2+2
            if lid < @trBtmStID
                @lazy[lid] += @lazy[id]/2  # sum
                @lazy[rid] += @lazy[id]/2  # sum
            else
                @tree[lid] += @lazy[id]/2  # sum
                @tree[rid] += @lazy[id]/2  # sum
            end
        end
        # puts "[EVAL] id:#{id}(#{calcRangeByID(id).join("~")}) ... #{@tree[id]}->#{@tree[id]+@lazy[id]}"  # sum,debug
        @tree[id] += @lazy[id]  # sum
        @lazy[id] = @defVal
    end

    def query_old(st,en)
        return calcQuery(0,0,@trBtmLen-1,st,en)
    end
    def calcQuery(curID,rngSt,rngEn,tarSt,tarEn)
        return @defVal if curID >= @trLen || rngEn < tarSt || tarEn < rngSt
        return @tree[curID] if curID >= @trBtmStID
        eval(curID)
        if tarSt <= rngSt && rngEn <= tarEn
            return @tree[curID]
        else
            lid,rid = curID*2+1,curID*2+2
            mid = (rngSt+rngEn)/2
            lVal,rVal = @defVal,@defVal
            lVal = calcQuery(lid,rngSt,mid,tarSt,tarEn) if lid <= @trBtmEnID && !(mid < tarSt || tarEn < rngSt)
            rVal = calcQuery(rid,mid+1,rngEn,tarSt,tarEn) if rid <= @trBtmEnID && !(rngEn < tarSt || tarEn < mid+1)
            return lVal + rVal  # sum
        end
    end
    def queryPoint(id)
        return @tree[@trBtmStID+id]
    end

    def query(tarL,tarR)
        return if tarR < tarL
        tarL = 0 if tarL < 0
        tarR = @arrLen-1 if @arrLen <= tarR
        return @tree[0] if tarL == 0 && tarR == @arrLen-1
        ret = @defVal
        que = [0]
        len = 1
        i = 0
        while i < len
            id = que[i]
            rngL,rngR = @rngs[id]
            eval(id) if @lazy[id] != @defVal
            if (tarL <= rngL && rngR <= tarR) || @trBtmStID <= id
                ret += @tree[id]  # sum
            else
                lid,rid = id*2+1,id*2+2
                mid = (rngL+rngR+1)/2
                if !(tarR < rngL || mid-1 < tarL)
                    if lid < @trBtmStID
                        que.push(lid)
                        len += 1
                    else
                        ret += @tree[lid]  # sum
                    end
                end
                if !(tarR < mid || rngR < tarL)
                    if rid < @trBtmStID
                        que.push(rid)
                        len += 1
                    else
                        ret += @tree[rid]  # sum
                    end
                end
            end
            i += 1
        end
        return ret
    end

    def update(tarL,tarR,val)
        return if tarR < tarL
        tarL = 0 if tarL < 0
        tarR = @arrLen-1 if @arrLen <= tarR
        que = [[0,false]]
        len = 1
        i = 0
        while i < len
            id,isLeaf = que[i]
            rngL,rngR = @rngs[id]
            eval(id) if id < @trBtmStID && @lazy[id] != @defVal
            if @trBtmStID <= id
                @tree[id] += val  # sum  
                que[i][1] = true
            elsif tarL <= rngL && rngR <= tarR
                @lazy[id] += val*(rngR-rngL+1)  # sum
                que[i][1] = true
            else
                lid,rid = id*2+1,id*2+2
                mid = (rngL+rngR+1)/2
                if !(tarR < rngL || mid-1 < tarL)
                    if lid < @trBtmStID
                        que.push([lid,false])
                        len += 1
                    else
                        @tree[lid] += val  # sum
                    end
                end
                if !(tarR < mid || rngR < tarL)
                    if rid < @trBtmStID
                        que.push([rid,false])
                        len += 1
                    else
                        @tree[rid] += val  # sum
                    end
                end
            end
            i += 1
        end
        i -= 1
        while 0 <= i
            while 0 <= i && que[i][1]
                i -= 1
            end
            break if i < 0
            id = que[i][0]
            @tree[id] = @tree[id*2+1]+@tree[id*2+2]  # sum
            i -= 1
        end
    end

    def getTree(); evalAll(); return @tree; end
    def getTreeBottom(); evalAll(); return @tree[@trBtmStID..@trBtmEnID]; end
    
    def showTreeStructure(tr); for i in 0..@trDepth; st=calcTopIDByDepth(i); puts tr[st..(st+2**i-1)].join(" "); end; end
    def showTree(); showTreeStructure(@tree); end
    def showLazy(); showTreeStructure(@lazy); end

    def calcBottomLength(len); return 1 if len<2; return 2**(Math.log2(len-1).to_i + 1); end
    def calcTopIDByDepth(dep); return nil if dep<0; return 2**dep-1; end
    def calcDepth(id); return 0 if id<0; return Math.log2(id+1).to_i; end
    def calcRangeByID(id); return [nil,nil] if id<0 || @trLen<=id; dep = calcDepth(id); topID = calcTopIDByDepth(dep); rngLen = 2**(@trDepth-dep); rngSt = rngLen*(id-topID); return [rngSt,rngSt+rngLen-1]; end
end


def torus(n,st,en)
  return [[0,n-1,0]] if st > en
  if st < 0
    add = n*((-st-1)/n + 1)
    st += add
    en += add
  end
  ret = []
  base = (en-st) / n
  st %= n
  en %= n
  return [[0,n-1,base+1]] if (en+1) % n == st
  if en < st
    ret.push([0,en,base+1])
    ret.push([en+1,st-1,base]) if en+1 <= st-1
    ret.push([st,n-1,base+1])
  else
    ret.push([0,st-1,base]) if 0 < st
    ret.push([st,en,base+1])
    ret.push([en+1,n-1,base]) if en+1 < n
  end
  return ret
end

n,m = gInts
a = gInts
b = gInts

st = LazySegTreeSum.new(a)

for i in 0..(m-1)
  bid = b[i]
  have = st.query(bid,bid)
  st.update(bid,bid,-1*have)
  torus(n,bid+1,bid+have).each{|e| st.update(e[0],e[1],e[2]) if 0 < e[2]}
end

puts st.getTreeBottom().join(" ")