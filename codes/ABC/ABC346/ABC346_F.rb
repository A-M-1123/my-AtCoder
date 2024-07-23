T=true; F=false; INF=(1.0/0)
def makeArrDim(*arg);len=arg.length;arr=Array.new(arg[-1],arg[0]);i=len-2;while 0<i;arr=Array.new(arg[i]).map{arr};i-=1;end;return arr;end
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(nu,de,mod);nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k < 1 || n <= k;nu=de=1;i=1;while i <= k;nu=nu*(n-i+1)%mod;de=de*i%mod;i+=1;end;return nu*powMod(de,mod-2,mod)%mod;end
def sort2darr(a);a.sort!{|x,y|(x[0]<=>y[0]).nonzero?||x[1]<=>y[1]};end
def copyArr(a);return Marshal.load(Marshal.dump(a));end
def pTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def pYN(bool);pTF(bool,"Yes","No");end
def p2darr(arr,part);arr.each{|ae| puts ae.join(part)};end
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# makeArrDim(val,*dim)
# makeNds(ndN,edgeN,edgeArr,1way?,wgt?,lbl?,spanning?)  <ex.makeNds(n,m,a,F,F,F,T)>
# getDigitLen(num) getNumApart(num)  <ex.4275=>[4,2,7,5]>
# fracMod(nume,deno,mod) powMod(base,exp,mod) combMod(n,k,mod)
# sort2darr(array)  <for 2*2-array>
# copyArr(array)
# p...TF(bool,strT,strF) YN(bool) 2darr(arr,partition)
# g...Int Ints IntMat(n) IntVars(n)
# g...Strs CharsDiv CharMat(n) StrsVert(n)

# binsJust binsJustOver binsOver(array,target,len) // 二部探索 条件を満たす最初のidをreturn
def binsJust(a,t,n);st,en=0,n-1;while st<=en;m=(st+en)/2;return m if a[m]==t;(a[m]<k)?(st=m+1):(en=m-1);end;return false;end; def binsJustOver(a,t,n);st,en=0,n;while st<en;m=(st+en)/2;(a[m]<t)?(st=m+1):(en=m);end;return st;end; def binsOver(a,t,n);st,en=0,n;while st<en;m=(st+en)/2;(a[m]<=t)?(st=m+1):(en=m);end;return st;end

def alpID(c)
  return c.ord - 'a'.ord
end

n = gInt
s = gCharsDiv
t = gCharsDiv

sLen = s.length
tLen = t.length

if (sUniq = s.sort.uniq).length == 1
  if sUniq == t.sort.uniq && s[0] == t[0]
    puts sLen * n / tLen
  else
    puts 0
  end
  exit
end

pfs = Array.new(26).map{Array.new(sLen+1,0)}
i = -1
while (i += 1) < sLen
  j = -1
  iord = alpID(s[i])
  while (j += 1) < 26
    if j == iord
      pfs[j][i+1] = pfs[j][i] + 1
    else
      pfs[j][i+1] = pfs[j][i]
    end
  end
end

if t.sort.uniq.length == 1
  sN = pfs[alpID(t[0])][sLen] * n
  puts sN / tLen
end

rngL = 0
rngR = 5*10**16
ansMax = 0
while rngL <= rngR
  k = (rngL+rngR)/2
  i = -1
  cnt = 0
  flag = T
  stID = 0
  while (i += 1) < tLen
    if n <= cnt
      flag = F
      break
    end
    tID = alpID(t[i])
    sFull = pfs[tID][-1]
    1stAble = sFull - pfs[tID][stID]
    if k <= 1stAble
      tar = pfs[tID][stID] + k
      enID = binsJustOver(pfs[tID],tar,sLen+1) - 1
      if enID == sLen-1
        stID = 0
        cnt += 1
      else
        stID = enID+1
      end
    else
      rest = k - 1stAble
      cnt += 1
      if n <= cnt
        flag = F
        break
      end
      times = rest / sFull
      rest = sFull * rest
      cnt += times
      if rest == 0
        enID = binsJustOver(pfs[tID],sFull,sLen+1) - 1
        if enID == sLen-1
          stID = 0
          cnt += 1
        else
          stID = enID+1
        end
      else
        if n <= cnt
          flag = F
          break
        end
        enID = binsJustOver(pfs[tID],rest,sLen+1) - 1
        if enID == sLen-1
          stID = 0
          cnt += 1
        else
          stID = enID+1
        end
      end
    end
  end
  if flag
    ansMax = k if ansMax < k
    rngL = k
  else
    rngR = k-1
  end
end
puts ansMax