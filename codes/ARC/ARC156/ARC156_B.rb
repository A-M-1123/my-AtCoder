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

def modpow(a, n, mod)
  exp = Math.log(n, 2).floor
  rep = modpow_cl(a, n, exp, mod)
  return rep[0]
end

def modpow_cl(a, n, exp, mod)
  if exp < 0
    rep = [1, a]
  else
    if n >= 2**exp
      rep = modpow_cl(a, n-2**exp, exp-1, mod)
      rep[0] = rep[0]*rep[1] % mod
    else
      rep = modpow_cl(a, n, exp-1, mod)
    end
    rep[1] = rep[1]**2 % mod
  end
  return rep
end

def modcomb(n, k, mod)
  return 1 if k < 1 || n <= k
  nume = deno = 1
  for i in 1..k
    nume = nume*(n-i+1) % mod
    deno = deno*i % mod
  end
  return nume*modpow(deno, mod-2, mod) % mod
end

MOD = 998244353

n,k = gInts
a = gInts

a.sort!
a.uniq!
n = a.length
aMin = a[0]
aMax = a[-1]

isOrgn = Array.new(aMax*2+1,F)
a.each{|ae| isOrgn[ae] = T}

id = 0
for i in 1..k
  id += 1 if 1 < i
  while isOrgn[id]
    id += 1
    isInc = T
  end
end
sMax = id

fact = Array.new(sMax+1,1)
inv = Array.new(sMax+1,1)
factInv = Array.new(sMax+1,1)
for i in 2..sMax
  fact[i] = (fact[i-1] * i) % MOD
  inv[i] = MOD - (inv[MOD%i] * (MOD/i)) % MOD
  factInv[i] = (factInv[i-1] * inv[i]) % MOD
end

ans = 0
for i in 0..k
  # puts "#{i} : #{id} , #{i+id}_C_#{i} = #{modcomb(i+id,i,MOD)}"
  cn = i+id
  ck = i
  nCk = (fact[cn] * factInv[ck]) % MOD
  nCk = (nCk * factInv[cn-ck]) % MOD
  ans = (ans + nCk) % MOD
  break if i == k
  while isOrgn[id]
    id -= 1
  end
  id -= 1
  break if id < 0
end
puts ans