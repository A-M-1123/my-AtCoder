T = true; F = false
def makeNds(n, m, a, if1way, ifWgt, ifLbl, ifTree)
  nds = Array.new(n+1).map{Array.new(0)}
  for i in 0..(m-1)
    id1=a[i][0]; id2=a[i][1]; w=a[i][2] if ifWgt
    if !ifWgt && !ifLbl
      nds[id1].push(id2)
      nds[id2].push(id1) if !if1way
    else
      nds[id1].push([id2].map{|e| e.push(w) if ifWgt; e.push(i+1) if ifLbl})
      nds[id1].push([id2].map{|e| e.push(w) if ifWgt; e.push(i+1) if ifLbl}) if !if1way
    end
  end
  n.times{|i| nds[i].push(-1)} if !ifTree
  return nds
end
# makeNds(n,m,a,1way?,wgt?,lbl?,tree?)
def swap(a,b);return b,a;end; def bins(a,t,st,en);if st>en;puts "Err...bins: st>en";exit;end;m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m])?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# swap(a,b) bins(a,t,0,n-1)
def getPfixsum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPfix(a,s,e);return a[e+1]-a[s];end
# getPfixsum(a) calcPfix(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

MOD = 10**9+7
n,m = getInts
a = getIntMat(m)

nds = makeNds(n,m,a,F,F,F,F)

# 幅優先探索
ckd = Array.new(n+1,0)
ids = [[1,1,0]] # [id,wayN,depth]
ckd[1] = 1
len = 1
i = 0
dep = 0
ans = -1
nxts = Hash.new(0)
nxtbrd = 1
while i < len
  tid = ids[i][0]
  dep = [dep,ids[i][2]].max
  if tid == n
    ans = ids[i][1]
    break
  end
  nds[tid].each do |e|
    if e > 0 && ckd[e] == 0
      nxts[e] = (nxts[e]+ids[i][1]) % MOD
    end
  end
  
  nxtbrd -= 1
  if nxtbrd == 0
  	nxts.each do |k,v|
      ids.push([k,v,ids[i][2]+1])
      ckd[k] = 1
      len += 1
      nxtbrd += 1
    end
    nxts = Hash.new(0)
  end
  i += 1
end

puts [0,ans].max