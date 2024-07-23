def swap(a,b);return b,a;end; def bins(a,t,st,en);if st>en;puts "Err...bins: st>en";exit;end;m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m])?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# swap(a,b) bins(a,t,0,n-1)
def getPfixsum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPfix(a,s,e);return a[e+1]-a[s];end
# getPfixsum(a) calcPfix(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

MOD = 10**9+7
s = getChars

len = s.length
c = ["c","h","o","k","u","d","a","i"]
dp = Array.new(len).map{Array.new(9,0)}

for i in 0..(len-1)
  if s[i] == "c"
    st = i
    break
  end
end

dp[st][0] = 1
for i in (st+1)..(len-1)
  for j in 0..7
    if s[i] == c[j]
      if j == 0
        dp[i][j] = (dp[i-1][j] + 1) % MOD
      else
        dp[i][j] = (dp[i-1][j] + dp[i-1][j-1]) % MOD
      end
    else
      dp[i][j] = dp[i-1][j]
    end
  end
end
puts dp[len-1][7]
