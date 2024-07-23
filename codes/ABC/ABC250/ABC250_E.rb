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

INF = 99999999999

n = gInt
a = gInts
b = gInts
q = gInt
x,y = gIntVars(q)

xy = Array.new(q).map{Array.new(3)}
for i in 0..(q-1)
  xy = [x[i],y[i],i]
end
# xy.sort!{|u,v| (u[0] <=> v[0]).nonzero? || (u[1] <=> v[1])}

ordn = Hash.new(0)
ordcnt = 0
aord = Array.new(n,0)
for i in 0..(n-1)
  if !ordn.has_key?(a[i])
    ordcnt += 1
    ordn[a[i]] = ordcnt
  end
  aord[i] = ordcnt
end

flag = true
bord = Array.new(n).map{Array.new(3)}
ordmin = INF
ordmax = -INF
bordn = Hash.new(0)
bordcnt = 0
for i in 0..(n-1)
  if !ordn.has_key?(b[i])
    ordcnt += 1
    ordn[y[i]] = ordcnt
  end
  if !bordn.has_key?(b[i])
    bordn[b[i]] = 1
    bordcnt += 1
    ordmin = [ordmin,ordn[b[i]]].min
    ordmax = [ordmax,ordn[b[i]]].max
  end
  bord[i] = [ordmin,ordmax,bordcnt]
end

for i in 0..(q-1)
  putsTF(bord[y[i]-1] == [1,aord[x[i]-1],aord[x[i]-1]], "Yes", "No")
end