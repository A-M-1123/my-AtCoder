T=true; F=false; INF=10**20
def putsTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def putsYN(bool);putsTF(bool,"Yes","No");end
# putsTF(bool, strT, strF) putsYN(bool)
def puts2DArray(arr,part);arr.each{|ae| puts ae.join(part)};end
# puts2DArray(arr,partition)
def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(array)
def turn2DArray(a,d,ang);d=d.downcase;return a.reverse if d=="x";return a.map(&:reverse) if d=="y";ang%=360;return nil if ang%90!=0;return a if ang==0;return turn2DArray(a,"l",90) if d=="r"&&ang==270;return turn2DArray(a,"r",90) if d=="l"&&ang==270;if ang==180;return a.reverse.map(&:reverse);elsif d=="r";return a.transpose.map(&:reverse);elsif d=="l";return a.transpose.reverse;end;return nil;end
# turn2DArray(array,dir,angle) ... dir=["x","y","l","r"], angle = 90n
def addMargin2DArray(a,c);h = a.length;w = a[0].length;for i in 0..(h-1);a[i].unshift(c);a[i].push(c);end;a.unshift(Array.new(w+2,c));a.push(Array.new(w+2,c));return a;end
# addMargin2DArray(arr,char)
def trimPos2DArray(a,c);h=a.length;w=a[0].length;hRng=[0,h-1];wRng=[0,w-1];hExs=Array.new(h,F);wExs=Array.new(w,F);for i in 0..(h-1);for j in 0..(w-1);if a[i][j]==c;hExs[i]=T;wExs[j]=T;end;end;end;for i in 0..(h-1);if hExs[i];hRng[0]=i;break;end;end;for i in 0..(h-1);if hExs[h-1-i];hRng[1]=h-1-i;break;end;end;for i in 0..(w-1);if wExs[i];wRng[0]=i;break;end;end;for i in 0..(w-1);if wExs[w-1-i];wRng[1]=w-1-i;break;end;end;return[hRng,wRng];end; def trim2DArray(a,pos);hRng,wRng=pos;raH=hRng[1]-hRng[0]+1;raW=wRng[1]-wRng[0]+1;retA=Array.new(raH).map{Array.new(raW)};for i in 0..(raH-1);for j in 0..(raW-1);retA[i][j]=a[hRng[0]+i][wRng[0]+j];end;end;return retA;end
# trimPos2DArray(arr,remainMark) trim2DArray(arr,pos):pos...2*2-Array
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i+1].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(ndN,arrL,array,1way?,wgt?,lbl?,tree?) template--makeNds(n,m,a,F,F,F,F)
def binsJust(a,t,n);st,en=0,n-1;while st<=en;m=(st+en)/2;return m if a[m]==t;(a[m]<k)?(st=m+1):(en=m-1);end;return false;end; def binsJustOver(a,t,n);st,en=0,n;while st<en;m=(st+en)/2;(a[m]<t)?(st=m+1):(en=m);end;return st;end; def binsOver(a,t,n);st,en=0,n;while st<en;m=(st+en)/2;(a[m]<=t)?(st=m+1):(en=m);end;return st;end
# binsJust & binsJustOver & binsOver(array,target,len)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(array) calcPFSum(array,st,en)[0<=st,en<len]
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
# getDigitLen(num) getNumApart(num)...e.g. 4275 -> [4,2,7,5]
def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(nu,de,mod);nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k<1||n<=k;nu=de=1;for i in 1..k;nu=nu*(n-i+1)%mod;de=de*i%mod;end;return nu*powMod(de,mod-2,mod)%mod;end
# fracMod(nume,deno,mod) powMod(base,exp,mod) combMod(n,k,mod)
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
# g...Int Ints IntMat(n) IntVars(n)
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# g...Strs CharsDiv CharMat(n) StrsVert(n)

n = gInt
r = gCharsDiv
c = gCharsDiv

a = Array.new(n).map{Array.new(n)}

isConfR = Array.new(n,F)
bool = T

for x in 0..(n-1)
  for y in 0..(n-1)
    if isConfR[y]
      a[y][x] = "*"
    else
      a[y][x] = r[y]
    end
  end
  
  isConfC = F
  for y in 0..(n-1)
    if !isConfC
      if a[y][x] == c[x] || a[y][x] == "*"
        a[y][x] = c[x]
        isConfC = T
        isConfR[y] = T
      else
        a[y][x] = "."
      end
    else
      a[y][x] = "*"
    end
  end
  if !isConfC
    bool = F
    break
  end
end

if !bool
  puts "No"
  exit
end

for y in 0..(n-1)
  next if isConfR[y]
  for x in 0..(n-1)
    if a[y][x] == "*"
      a[y][x] = r[y]
      isConfR[y] = T
      break
    end
  end
  if !isConfR[y]
    bool = F
    break
  end
end

rRest = Array.new(n).map{Array.new(3)}
rRestN = Array.new(n,0)
rFree = Array.new(n,0)
cRest = Array.new(n).map{Array.new(3)}
cRestN = Array.new(n,0)
cFree = Array.new(n,0)

ha = {"A" => 0, "B" => 1, "C"=> 2}
alp = ["A","B","C"]
for y in 0..(n-1)
  cntF = 0
  exist = [F,F,F]
  for x in 0..(n-1)
    if a[y][x] == "*"
      cntF += 1
    elsif a[y][x] != "."
      exist[ha[a[y][x]]] = T
    end
  end
  rRest[y] = exist
  exist.each{|b| rRestN[y] += 1 if !b}
  rFree[y] = cntF
end
for x in 0..(n-1)
  cntF = 0
  exist = [F,F,F]
  for y in 0..(n-1)
    if a[y][x] == "*"
      cntF += 1
    elsif a[y][x] != "."
      exist[ha[a[y][x]]] = T
    end
  end
  cRest[x] = exist
  exist.each{|b| cRestN[x] += 1 if !b}
  cFree[x] = cntF
end

for i in 0..(n-1)
  if rRestN[i] > rFree[i] || cRestN[i] > cFree[i]
    bool = F
    break
  end
end

if !bool
  puts "No"
  exit
end

while true
  isChange = F
  for y in 0..(n-1)
    for x in 0..(n-1)
      if rRestN[y] <= 1 && cRestN[x] <= 1 && rRestN[y]+cRestN[x] > 0
        tmp = []
        for i in 0..2
          if !rRest[y][i] || !cRest[x][i]
            tmp.push(alp[i])
          end
        end
        tmp.sort!
        tmp.uniq!
        if tmp.length == 1
          a[y][x] = tmp[0]
          hid = ha[tmp[0]]
          rRest[y][hid] = T
          rRestN[y] -= 1
          cRest[x][hid] = T
          cRestN[x] -= 1
          isChange = T
        end
      end
    end
  end
  break if !isChange
end

for y in 0..(n-1)
  for x in 0..(n-1)
    next if a[y][x] != "*"
    flag = F
    for i in 0..2
      if !rRest[y][i] && !cRest[x][i]
        a[y][x] = alp[i]
        if !rRest[y][i]
          rRest[y][i] = T
          rRestN[y] -= 1
        end
        if !cRest[x][i]
          cRest[x][i] = T
          cRestN[x] -= 1
        end
        flag = T
        break
      end
    end
    next if flag
    for i in 0..2
      if !rRest[y][i] || !cRest[x][i]
        a[y][x] = alp[i]
        if !rRest[y][i]
          rRest[y][i] = T
          rRestN[y] -= 1
        end
        if !cRest[x][i]
          cRest[x][i] = T
          cRestN[x] -= 1
        end
        break
      end
    end
  end
end

cnt = 0
for y in 0..(n-1)
  for x in 0..(n-1)
    if a[y][x] == "*"
      a[y][x] = alp[cnt%3]
      cnt += 1
    end
  end
end

if rRestN.sum + cRestN.sum == 0
  puts "Yes"
  puts2DArray(a,"")
else
  puts "No"
end