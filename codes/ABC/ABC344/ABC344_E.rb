T=true; F=false; INF=(1.0/0)
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

class IdCompless
    def initialize(vs); @vs=vs.sort.uniq; @vLen=vs.length; @hs=Hash.new(0); i=-1; while (i+=1)<@vLen; @hs[@vs[i]]=i; end; end
    def val(id); return @vs[id]; end
    def id(v); return @hs[v]; end
    def ids(vArr); ids=Array.new(vArr.length); i=-1; while (i+=1)<vArr.length; ids[i]=@hs[vArr[i]]; end; return ids; end
    def vals(); return @vs; end
    def length(); return @vLen; end
end

n = gInt
a = gInts
q = gInt
qu = gIntMat(q)

vals = copyArr(a)
for i in 0..(q-1)
  vals << qu[i][2] if qu[i][0] == 1
end
vals.sort!.uniq!
cmp = IdCompless.new(vals)

ac = []
for i in 0..(n-1)
  ac << cmp.id(a[i])
end
tw = TwoWayList.new(cmp.length, ac)

cmd,x,y = 0,0,0
for i in 0..(q-1)
  if qu[i][0] == 1
    cmd,x,y = qu[i]
    tw.insNxt(cmp.id(x),cmp.id(y))
  else
    cmd,x = qu[i]
    tw.delete(cmp.id(x))
  end
end

ls = tw.getList()
len = tw.getLength()
for i in 0..(len-1)
  ls[i] = cmp.val(ls[i])
end
puts ls.join(" ")