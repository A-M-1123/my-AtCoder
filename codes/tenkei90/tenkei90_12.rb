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

class UnionFind
    def initialize(size,*args); (!args.empty? && 0<args[0])?(@idx=1):(@idx=0); @size=size; @root=(0..(size-1+@idx)).to_a; @rank=Array.new(size+@idx,0); @isRoot=Array.new(size+@idx,true); @path=[]; end  
    def unite(id1, id2); rt1,rt2=findRoot(id1),findRoot(id2); return if rt1==rt2; if @rank[rt1]>=@rank[rt2]; @root[rt2]=rt1; @isRoot[id2]=false; @rank[rt2]+=1 if @rank[rt1]==@rank[rt2]; else; @root[rt1]=rt2; @isRoot[id1]=false; end; end
    def isSame(id1, id2); return findRoot(id1)==findRoot(id2); end
    def getRoot(); updateAll(); (@idx == 0)?(return @root):(return @root[1..@size]); end
    def getGroup(); updateAll(); hs={}; i=@idx-1; while (i += 1)<@size+@idx; hs[@root[i]]||=Array.new(0); hs[@root[i]].push(i); end; ret=[]; hs.each do |k,v|; ret.push(v); end; return ret; end
    
    def findRoot(id); while @root[id]!=id; @path.push(id) if !@isRoot[@root[id]]; id=@root[id]; @isRoot[id]=false; end; while (pt=@path.pop); @root[pt]=id; end; return id; end
    def updateAll(); i=@idx-1; while (i+=1)<@size+@idx; findRoot(i) if !@isRoot[@root[i]]; end; end
end

h,w = gInts
q = gInt

id = Array.new(h).map{Array.new(w)} # 0-index
for y in 0..(h-1)
  for x in 0..(w-1)
    id[y][x] = y*w+x
  end
end

isRed = Array.new(h+2).map{Array.new(w+2,F)} # 1-index
uf = UnionFind.new(h*w) # 0-index
d = [[1,0],[-1,0],[0,1],[0,-1]]
for query in 1..q
  line = gInts
  if line[0] == 1
    t,r,c = line
    isRed[r][c] = T
    for i in 0..3
      y = r+d[i][0]
      x = c+d[i][1]
      if isRed[y][x]
        uf.unite(id[r-1][c-1],id[y-1][x-1])
      end
    end
  else
    t,ra,ca,rb,cb = line
    pYN(isRed[ra][ca] && isRed[rb][cb] && uf.isSame(id[ra-1][ca-1],id[rb-1][cb-1]))
  end
end