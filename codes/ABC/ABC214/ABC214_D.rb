class UnionFind
  def initialize(size)
    @parent = Array.new(size+1, -1)
  end

 def find(x)
   if @parent[x] < 0
     return x
   else
     @parent[x] = find(@parent[x])
     return @parent[x]
   end
 end
  
  def same?(x,y)
    return find(x) == find(y)
  end
  
  def unite(x,y)
    x = find(x)
    y = find(y)
    if x == y
      return 0
    else
      if @parent[x] > @parent[y]
        x,y = y,x
      end
      @parent[x] += @parent[y]
      @parent[y] = x
    end
  end
  
  def size(x)
    return -@parent[find(x)]
  end
end

def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(a)
T=true;F=false;def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i+1].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(n,m,a,1way?,wgt?,lbl?,tree?) template -- makeNds(n,m,a,F,F,F,F)
def bins(a,t,st,en);if st>en;puts "Err...bins: st>en";exit;end;m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m])?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# bins(a,tar,0,n-1)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(a) calcPFSum(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

n = getInt
a = getIntMat(n-1)

a.sort!{|x,y| x[2]<=>y[2]}

uf = UnionFind.new(n+1)

ans = 0
for i in 0..(n-2)
  id0 = a[i][0]; id1 = a[i][1]
  size0 = uf.size(id0); size1 = uf.size(id1)
  ans += a[i][2] * (size0*size1)
  uf.unite(id0, id1)
end
puts ans