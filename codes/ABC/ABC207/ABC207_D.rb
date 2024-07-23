def swap(a,b);return b,a;end; def bins(a,t,st,en);m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m]) ?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# swap(a,b) bins(a,t,0,n-1)
def getPfixsum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPfix(a,s,e);return a[e+1]-a[s];end
# getPfixsum(a) calcPfix(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

def pivRev(pos, piv)
  d = pos - piv
  return pos - 2*d
end

n = getInt
a = getIntMat(n)
c = getIntMat(n)

for i in 0..(n-1)
  a[i][0] += 10
  a[i][1] += 10
  c[i][0] += 10
  c[i][1] += 10
end

axmax = aymax = 0
axmin = aymin = 9999999
for i in 0..(n-1)
  axmax = [axmax, a[i][0]].max
  axmin = [axmin, a[i][0]].min
  aymax = [aymax, a[i][1]].max
  aymin = [aymin, a[i][1]].min
end
for i in 0..(n-1)
  a[i][0] -= axmin
  a[i][1] -= aymin
end
axmin = 0
axmax -= axmin
aymin = 0
aymax -= aymin
a.sort!

cxmax = cymax = 0
cxmin = cymin = 9999999
for i in 0..(n-1)
  cxmax = [cxmax, c[i][0]].max
  cxmin = [cxmin, c[i][0]].min
  cymax = [cymax, c[i][1]].max
  cymin = [cymin, c[i][1]].min
end
for i in 0..(n-1)
  c[i][0] -= cxmin
  c[i][1] -= cymin
end
cxmax -= cxmin
cxmin = 0
cymax -= cymin
cymin = 0


cs = Array.new(4).map{Array.new(n).map{Array.new(2)}}
for i in 0..(n-1)
  cs[0][i] = [c[i][0], c[i][1]]
  cs[1][i] = [c[i][1], pivRev(c[i][0],cxmax/2.0).to_i]
  cs[2][i] = [pivRev(c[i][0],cxmax/2.0).to_i, pivRev(c[i][1],cymax/2.0).to_i]
  cs[3][i] = [pivRev(c[i][1],cymax/2.0).to_i, c[i][0]]
end

ans = false
for t in 0..3
  flag = true
  cs[t].sort!
  for i in 0..(n-1)
    if a[i] != cs[t][i]
      flag = false
      break
    end
  end
  if flag == true
    ans = true
    break
  end
end
(ans) ? (puts "Yes"):(puts "No")