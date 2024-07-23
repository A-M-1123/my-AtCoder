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
def gChars();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrs(n);n.times.map{gets.chomp};end; def gQuery(r,c,t);return[] if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# g...Chars CharsDiv CharMat(n) Strs(n) Query(row,col,[s0,i1,f2])

n,x,y = gInts

uv = gIntMat(n-1)
nds = makeNds(n,n-1,uv,F,F,F,T)

ords = Array.new(n+1,0)
ords[x] = 1

vis = Array.new(n+1,F)
queue = [x]
vis[x] = T
len = 1
i = 0
flag = F
while i < len
  cur = queue[i]
  nds[cur].each do |nd|
    if 0 < nd && !vis[nd]
      queue.push(nd)
      vis[nd] = T
      ords[nd] = ords[cur] + 1
      if nd == y
        flag = T
        break
      end
      len += 1
    end
  end
  break if flag
  i += 1
end

cur = y
ord = ords[y]
ans = [y]
while 1 < ord
  nds[cur].each do |nd|
    if ords[nd] == ord-1
      ans.push(nd)
      ord -= 1
      cur = nd
      break
    end
  end
end

puts ans.reverse.join(" ")