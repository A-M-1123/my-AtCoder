T=true; F=false
def putsTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end
# putsTF(bool, strT, strF)
def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(array)
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i+1].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(ndN,arrL,array,1way?,wgt?,lbl?,tree?) template--makeNds(n,m,a,F,F,F,F)
def bins(a,t,st,en);if st>en;puts "Err...bins: st>en";exit;end;m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m])?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# bins(array,target,0,n-1)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(array) calcPFSum(array,st,en)
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
# g...Int Ints IntMat(n) IntVars(n)
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# g...Strs CharsDiv CharMat(n) StrsVert(n)

class UnionFind
  def initialize(size)
    @rank = Array.new(size, 0)
    @parent = Array.new(size, &:itself)
  end

  def unite(id_x, id_y)
    x_parent = get_parent(id_x)
    y_parent = get_parent(id_y)
    return if x_parent == y_parent

    if @rank[x_parent] > @rank[y_parent]
      @parent[y_parent] = x_parent
    else
      @parent[x_parent] = y_parent
      @rank[y_parent] += 1 if @rank[x_parent] == @rank[y_parent]
    end
  end

  def get_parent(id_x)
    @parent[id_x] == id_x ? id_x : (@parent[id_x] = get_parent(@parent[id_x]))
  end

  def same_parent?(id_x, id_y)
    get_parent(id_x) == get_parent(id_y)
  end
end

def nxtCol(n)
  n = (n+1) % 2
  return n
end

n,m = gInts
uv = gIntMat(m)

nds = makeNds(n,m,uv,F,F,F,F)

uf = UnionFind.new(n)
uv.each{|e| uf.unite(e[0]-1,e[1]-1)}
pars = []
for i in 0..(n-1)
  pars.push(uf.get_parent(i))
end
pars.sort!.uniq!
partsN = pars.length

partN = Array.new(partsN,0)
col0N = Array.new(partsN,0)

col = Array.new(n+1)  # 0 or 1
vis = Array.new(n+1,F)
flag = T

firstID = 1
for tryN in 0..(partsN-1)
  while vis[firstID]
    firstID += 1
  end
  ids = [[firstID,0]]
  col[firstID] = 0
  vis[firstID] = T
  idsLen = 1
  idx = 0
  while idx < idsLen && flag
    curID = ids[idx][0]
    curCol = ids[idx][1]
    col0N[tryN] += 1 if curCol == 0
    partN[tryN] += 1
    newCol = nxtCol(curCol)
    nds[curID].each do |chi|
      if 0 < chi
        if !vis[chi]
          ids.push([chi,newCol])
          col[chi] = newCol
          vis[chi] = T
          idsLen += 1
        else
          if col[chi] == curCol
            flag = F
            break
          end
        end
      end
    end
    break if !flag
    idx += 1
  end
  break if !flag
end

# check colors one more time
for i in 1..n
  curCol = col[i]
  nds[i].each do |chi|
    if 0 < chi
      if curCol == col[chi]
        flag = F
        break
      end
    end
  end
  break if !flag
end

if flag
  ans = 0
  for i in 0..(partsN-1)
    ans += col0N[i] * (partN[i]-col0N[i])
  end
  pfs = getPFSum(partN)
  for i in 0..(partsN-2)
    ans += partN[i] * calcPFSum(pfs, i+1, partsN-1)
  end
  puts ans - m
else
  puts 0
end