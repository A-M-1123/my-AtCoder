def swap(a,b);return b,a;end; def bins(a,t,st,en);m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m]) ?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# swap(a,b) bins(a,t,0,n-1)
def getPfixsum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPfix(a,s,e);return a[e+1]-a[s];end
# getPfixsum(a) calcPfix(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

n,k = getInts
c = getInts

hs = Hash.new(0)
for i in 0..(k-1)
  hs[c[i]] += 1
end
ans = hs.length
prev = ans

for i in k..(n-1)
  eles = prev
  if hs[c[i-k]] > 1
    hs[c[i-k]] -= 1
  else
    hs.delete(c[i-k])
    eles -= 1
  end
  hs[c[i]] += 1
  if hs[c[i]] == 1
    eles += 1
  end
  ans = [ans, eles].max
  prev = eles
end
puts ans