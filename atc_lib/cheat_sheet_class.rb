# class 累積和 / 0-index
class PFS
    def initialize(a); @len=a.length; @pfs=Array.new(@len+1,0); i=-1; while(i+=1)<@len; @pfs[i+1]=@pfs[i]+a[i]; end; end
    def calc(l,r); l=check(l); r=check(r); return 0 if l>r; return @pfs[r+1]-@pfs[l]; end;  def check(i); return 0 if i<0; return @len-1 if @len<=i; return i; end
end
class PFS2d
    def initialize(a,h,w); @pfs=Array.new(h+1).map{Array.new(w+1,0)}; @w=w; @h=h; y=0; while (y+=1)<=@h; x=0; while (x+=1)<=@w; @pfs[y][x]=a[y-1][x-1]+@pfs[y][x-1]+@pfs[y-1][x]-@pfs[y-1][x-1]; end; end; end
    def calc(y1,x1,y2,x2); y1,y2=checkH(y1),checkH(y2); x1,x2=checkW(x1),checkW(x2); return @pfs[y2+1][x2+1]-@pfs[y2+1][x1]-@pfs[y1][x2+1]+@pfs[y1][x1]; end;  def checkH(y); return 0 if y<0; return @h-1 if @h-1<y; return y; end;  def checkW(x); return 0 if x<0; return @w-1 if @w-1<x; return x; end
end

# class フェニック木(BIT) / 0-index
class BIT
    def initialize(arr); @defVal=0; @arrLen=arr.length; @trDepth=(@arrLen-1).bit_length; @trLen=(1<<@trDepth)+1; @tree=initTree(arr); end
    def initTree(arr); tr=Array.new(@trLen,@defVal); i=-1; while (i+=1)<@trLen-1; tr[i+1]=calc(tr[i+1],(arr[i]||0)); tr[getParent(i+1)]=calc(tr[getParent(i+1)],tr[i+1]) if i+1<@trLen-1; end; return tr; end

    def query(tarL,tarR); return nil if tarL>tarR; tarL=0 if tarL<0; tarR=@arrLen-1 if @arrLen<=tarR; return invCalc(calcQuery(tarR+1),calcQuery(tarL)); end;  def calcQuery(r); ret=@defVal; while 0<r; ret=calc(ret,@tree[r]); r-=calcLowestBit(r); end; return ret; end
    def update(id,d); return false if id<0 || @arrLen<=id; calcUpdate(id+1,d); end;  def calcUpdate(i,d); while i && i<@trLen; @tree[i]=calc(@tree[i],d); i=getParent(i); end; end

    def calc(x,y); return x+y; end
    def invCalc(x,y); return calc(x,@defVal-y); end
    def show(); s=Array.new(@trDepth+1).map{Array.new(0)}; i=0; while (i+=1) <= @trLen; dep=calcLowestBit(i).bit_length-1; fil = '-'*(@tree[i].to_s.length); j=0-1; while (j+=1) <= @trDepth; s[j] << ((j==dep)?(@tree[i]):(fil)); end; end; i=@trDepth+1; while (i-=1) >= 0; puts s[i].join(' '); end; end;  def getParent(id); return nil if id<=0 || @trLen-1<=id; return id+calcLowestBit(id); end;  def calcLowestBit(n); return nil if n<=0; return n-(n&(n-1)); end
end

# class 座標圧縮 / 0-index
class IdCompless
    def initialize(vs); @vs=vs.sort.uniq; @vLen=vs.length; @hs=Hash.new(0); i=-1; while (i+=1)<@vLen; @hs[@vs[i]]=i; end; end
    def val(id); return @vs[id]; end
    def id(v); return @hs[v]; end
    def getIds(vArr); ids=Array.new(vArr.length); i=-1; while (i+=1)<vArr.length; ids[i]=@hs[vArr[i]]; end; return ids; end
    def getVals(); return @vs; end
    def getLength(); return @vLen; end
end

# class Union-Find / .new(size):0-index => .new(size,1):1-index 
class UnionFind
    def initialize(size,*args); (!args.empty? && 0<args[0])?(@idx=1):(@idx=0); @size=size; @root=(0..(size-1+@idx)).to_a; @rank=Array.new(size+@idx,0); @isRoot=Array.new(size+@idx,true); @path=[]; end  
    def unite(id1, id2); rt1,rt2=findRoot(id1),findRoot(id2); return if rt1==rt2; if @rank[rt1]>=@rank[rt2]; @root[rt2]=rt1; @isRoot[id2]=false; @rank[rt2]+=1 if @rank[rt1]==@rank[rt2]; else; @root[rt1]=rt2; @isRoot[id1]=false; end; end
    def isSame(id1, id2); return findRoot(id1)==findRoot(id2); end
    def getRoot(); updateAll(); (@idx == 0)?(return @root):(return @root[1..@size]); end
    def getGroup(); updateAll(); hs={}; i=@idx-1; while (i += 1)<@size+@idx; hs[@root[i]]||=Array.new(0); hs[@root[i]].push(i); end; ret=[]; hs.each do |k,v|; ret.push(v); end; return ret; end
    
    def findRoot(id); while @root[id]!=id; @path.push(id) if !@isRoot[@root[id]]; id=@root[id]; @isRoot[id]=false; end; while (pt=@path.pop); @root[pt]=id; end; return id; end
    def updateAll(); i=@idx-1; while (i+=1)<@size+@idx; findRoot(i) if !@isRoot[@root[i]]; end; end
end

# class 優先度付きキュー / .new():最小 => .new(false):最大
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
# class 優先度付きキュー(配列) / .new(vctLen,targetId):最小 => .new(vctLen,targetId,false):最大
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

# class 双方向リスト / .new(size):空リスト => .new(size,array):arrayで初期化
class TwoWayList
    def initialize(size,*args); @size=size; @pre=Array.new(size,-1); @nxt=Array.new(size,-1); @st=@en=-1; @length=0; @isDefault=true; setArray(args[0]) if !args[0].nil? && args[0].instance_of?(Array) && !args[0].empty?; end
    def setArray(arr); return if !@isDefault || arr.nil? || arr.min < 0 || @size <= arr.max || arr != arr.uniq; @isDefault=false; @st=arr[0]; i=0; while (i += 1) < arr.length; connect(arr[i-1],arr[i]); end; @en=arr[-1]; @length=arr.length; end

    def insPre(nxtID,insID); return makeNode(insID) if @isDefault; return if isOutOfRange(nxtID) || isOutOfRange(insID) || !isConnect(nxtID); delete(insID) if isConnect(insID); if nxtID==@st; @st=insID; else; connect(@pre[nxtID],insID); end; connect(insID,nxtID); @length+=1; end
    def insNxt(preID,insID); return makeNode(insID) if @isDefault; return if isOutOfRange(preID) || isOutOfRange(insID) || !isConnect(preID); delete(insID) if isConnect(insID); if preID==@en; @en=insID; else; connect(insID,@nxt[preID]); end; connect(preID,insID); @length+=1; end
    def delete(id); return if @isDefault; if isConnect(id); preID,nxtID=@pre[id],@nxt[id]; if id==@st; @pre[nxtID]=-1; @st=nxtID; elsif id==@en; @nxt[preID]=-1; @en=preID; else; @nxt[preID],@pre[nxtID]=nxtID,preID; end; @pre[id],@nxt[id]=-1,-1; @length-=1; elsif @st==id; @st=@en=-1; @pre[id],@nxt[id]=-1,-1; @isDefault=true; @length=0; end; end
    def makeNode(id); return if !@isDefault||isOutOfRange(id); @isDefault=false; @st=@en=id; @length=1; end
    def getList(); return [] if @isDefault; ret=Array.new(@length); id=@st; i=-1; while (i+=1) < @length; ret[i]=id; id=@nxt[id]; end; return ret; end
    def getLength(); return @length; end

    def connect(id1,id2); @nxt[id1]=id2; @pre[id2]=id1; end; def isOutOfRange(id); return (id < 0 || @size <= id); end; def isConnect(id); return (0 <= @pre[id] || 0 <= @nxt[id] || id == @st); end
end

# calss セグ木(最大値) // SegTreeMax.new(array), update(id,v)...vで上書き
class SegTreeMax
    def initialize(arr); @defVal = -10**16; @arrLen=arr.length; @trBtmLen=calcWidth(@arrLen); @trLen=@trBtmLen*2-1; @trBtmStID=@trBtmLen-1; @trBtmEnID=@trBtmStID+@arrLen-1; @trDepth=calcDepth(@trBtmStID); @tree=initTree(arr); end;  def initTree(arr); tr=Array.new(@trLen,@defVal); i = -1; while (i += 1)<@arrLen; tr[i+@trBtmStID]=arr[i]; end; dep=@trDepth; while (dep -= 1)>=0; topID=calcTopIDByDepth(dep); i = -1; while (i+=1) < (1 << dep); lid,rid=calcChildID(topID+i); tr[topID+i]=calculate(tr[lid],tr[rid]); end; end; return tr; end
    def query(tarL,tarR); return nil if tarL>tarR; tarL=0 if tarL<0; tarR=@arrLen-1 if @arrLen<=tarR; return calcRange(tarL,tarR); end;  def calcRange(l,r); ret=@defVal; r+=1; isClimb = (0 < l)?(true):(false); while l<r; if isClimb; w=(((1 << l.bit_length) - l)&l); if w<=r-l; ret=calculate(ret,@tree[calcIDByRange(l,w)]); l+=w; else; isClimb=false; end; else; w = 1 << ((r-l).bit_length-1); ret=calculate(ret,@tree[calcIDByRange(l,w)]); l+=w; end; end; return ret; end
    def getPoint(id); return if id<0 || @arrLen<=id; return @tree[@trBtmStID+id]; end
    def update(id,v); return if id<0 || @arrLen<=id; id+=@trBtmStID; @tree[id]=v; lid=(id&1 == 1)?(id):(id-1); while (id=calcParentID(id)); newV=calculate(@tree[lid],@tree[lid+1]); if @tree[id]!=newV; @tree[id]=newV; lid=(id&1 == 1)?(id):(id-1); else; break; end; end; end;  def calculate(v1,v2); return (v1>v2)?(v1):(v2); end;  def calcWidth(len); return 1 if len<2; return 1 << (len-1).bit_length; end;  def calcDepth(id); return 0 if id<0; return (id+1).bit_length-1; end;  def calcIDByRange(l,w); return calcTopIDByDepth(@trDepth+1-w.bit_length)+l/w; end;  def calcTopIDByDepth(dep); return (1 << dep)-1; end;  def calcParentID(id); return (0 < id)?((id-1)/2):(nil); end;  def calcChildID(id); return id*2+1,id*2+2; end
end
# calss セグ木(最小値) // SegTreeMin.new(array), update(id,v)...vで上書き
class SegTreeMin
    def initialize(arr); @defVal = 10**16; @arrLen=arr.length; @trBtmLen=calcWidth(@arrLen); @trLen=@trBtmLen*2-1; @trBtmStID=@trBtmLen-1; @trBtmEnID=@trBtmStID+@arrLen-1; @trDepth=calcDepth(@trBtmStID); @tree=initTree(arr); end;  def initTree(arr); tr=Array.new(@trLen,@defVal); i = -1; while (i += 1)<@arrLen; tr[i+@trBtmStID]=arr[i]; end; dep=@trDepth; while (dep -= 1)>=0; topID=calcTopIDByDepth(dep); i = -1; while (i+=1) < (1 << dep); lid,rid=calcChildID(topID+i); tr[topID+i]=calculate(tr[lid],tr[rid]); end; end; return tr; end
    def query(tarL,tarR); return nil if tarL>tarR; tarL=0 if tarL<0; tarR=@arrLen-1 if @arrLen<=tarR; return calcRange(tarL,tarR); end;  def calcRange(l,r); ret=@defVal; r+=1; isClimb = (0 < l)?(true):(false); while l<r; if isClimb; w=(((1 << l.bit_length) - l)&l); if w<=r-l; ret=calculate(ret,@tree[calcIDByRange(l,w)]); l+=w; else; isClimb=false; end; else; w = 1 << ((r-l).bit_length-1); ret=calculate(ret,@tree[calcIDByRange(l,w)]); l+=w; end; end; return ret; end
    def getPoint(id); return if id<0 || @arrLen<=id; return @tree[@trBtmStID+id]; end
    def update(id,v); return if id<0 || @arrLen<=id; id+=@trBtmStID; @tree[id]=v; lid=(id&1 == 1)?(id):(id-1); while (id=calcParentID(id)); newV=calculate(@tree[lid],@tree[lid+1]); if @tree[id]!=newV; @tree[id]=newV; lid=(id&1 == 1)?(id):(id-1); else; break; end; end; end;  def calculate(v1,v2); return (v1<v2)?(v1):(v2); end;  def calcWidth(len); return 1 if len<2; return 1 << (len-1).bit_length; end;  def calcDepth(id); return 0 if id<0; return (id+1).bit_length-1; end;  def calcIDByRange(l,w); return calcTopIDByDepth(@trDepth+1-w.bit_length)+l/w; end;  def calcTopIDByDepth(dep); return (1 << dep)-1; end;  def calcParentID(id); return (0 < id)?((id-1)/2):(nil); end;  def calcChildID(id); return id*2+1,id*2+2; end
end
