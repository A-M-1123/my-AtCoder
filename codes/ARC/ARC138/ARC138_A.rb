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

INF = 999999999999

n,k = getInts
a = getInts

ls = Array.new(k).map{Array.new(2)}
rs = Array.new(n-k).map{Array.new(2)}

for i in 0..(k-1)
  ls[i] = [a[i], i]
end
for i in k..(n-1)
  rs[i-k] = [a[i], i]
end

minl = 0
ls.each{|e| minl = [minl,e[0]].min}
maxr = 0
rs.each{|e| maxr = [maxr,e[0]].max}

if minl < maxr
  maxrg = Array.new(n-k)
  maxrg[0] = rs[0][0]
  for i in 1..(n-k-1)
    maxrg[i] = [maxrg[i-1], rs[i][0]].max
  end
  
  min = INF
  st = n-k-1
  for i in 0..(k-1)
    if ls[i][0] < maxrg[st]
      while st > 0 && ls[i][0] < maxrg[st-1]
        st -= 1
      end
      min = [min, (k-1-ls[i][1])+(rs[st][1]-k)+1].min
    end
    st += 1 if st < n-k-1
  end
  if min == INF
    puts -1
  else
    puts min
  end
else
  puts -1
end