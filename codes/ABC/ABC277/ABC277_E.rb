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

def viewNds(n,nds)
  for i in 1..n
    puts "#{i} : #{nds[i].join(" ")}"
  end
end

INF = 99999999999

n,m,k = gInts
uva = gIntMat(m)
s = gInts

nds = Array.new(2).map{Array.new(n+1).map{Array.new(0)}}
for i in 0..(m-1)
  u,v,a = uva[i]
  nds[a][u].push(v)
  nds[a][v].push(u)
end

for i in 0..1
  for j in 1..n
    nds[i][j].sort!.uniq!
  end
end

swt = Array.new(n+1,F)
s.each{|se| swt[se] = T}

vis = Array.new(2).map{Array.new(n+1,F)}
bfs = []
bfsLen = 0
id = 0
mode = 1

vis[mode][1] = T
bfs.push([1,1,0])  # [id,mode,dist]
bfsLen += 1
ans = INF
while id < bfsLen
  cur = bfs[id][0]
  mode = bfs[id][1]
  dist = bfs[id][2]
  # puts "[#{cur},#{mode},#{dist}]"
  nds[mode][cur].each do |e|
    if e == n
      ans = [ans,dist+1].min
    elsif !vis[mode][e]
      vis[mode][e] = T
      bfs.push([e,mode,dist+1])
      bfsLen += 1
    end
  end
  if swt[cur]
    modeNxt = (mode+1)%2
    vis[modeNxt][cur] = T
    nds[modeNxt][cur].each do |e|
      if e == n
        ans = [ans,dist+1].min
      elsif !vis[modeNxt][e]
        vis[modeNxt][e] = T
        bfs.push([e,modeNxt,dist+1])
        bfsLen += 1
      end
    end
  end
  id += 1
end

if ans == INF
  puts -1
else
  puts ans
end