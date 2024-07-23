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

def rangePSum(pSumLen,pSum,st,en)
  if st <= en
    return pSum[en+1]-pSum[st]
  elsif en+1==st
    return pSum[pSumLen-1]
  else
    return pSum[pSumLen-1]-rangePSum(pSumLen,pSum,en+1,st-1)
  end
end

n,q,x = gInts
w = gInts

wSum = 0
for i in 0..(n-1)
  wSum += w[i]
end
pSum = Array.new(n+1,0)
for i in 0..(n-1)
  pSum[i+1] = pSum[i]+w[i]
end

block = Array.new(n).map{Array.new(2,-1)}
en = -1
defPot = 0
prePot = 0
if wSum < x
  if x % wSum > 0
    defPot += (x/wSum)*n
    x %= wSum
  else
    defPot += (x/wSum)*(n-1)
    x = wSum
  end
end
for st in 0..(n-1)
  en = (en+1)%n if prePot <= 1
  while rangePSum(n+1,pSum,st,en) < x
    en = (en+1)%n
  end
  if st <= en
    pot = en-st+1
  else
    pot = (n-st)+en+1
  end
  block[st] = [en,defPot+pot]
  prePot = pot
end

# debug
=begin
for i in 0..(n-1)
  puts "block[#{i}] : [#{block[i][0]},#{block[i][1]}]"
end
=end

roop = []
roopLen = 0
ckd = Array.new(n).map{Array.new(2,F)}
id = 0
cnt = 1
while !ckd[id][0]
  roop.push(block[id][1])
  roopLen += 1
  ckd[id] = [T,cnt]
  cnt += 1
  id = (block[id][0]+1) % n
end

# puts roop.join(" ") # debug

nonLoop = ckd[id][1]-1
roopLen -= nonLoop
for i in 0..(q-1)
  k = gInt
  k -= 1
  if k < nonLoop
    puts roop[k]
  else
    id = (k-nonLoop) % roopLen + nonLoop
    puts roop[id]
  end
end