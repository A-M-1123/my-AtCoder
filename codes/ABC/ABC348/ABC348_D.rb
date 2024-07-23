T=true; F=false; INF=9999999999999 # 10**13-1
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

def addMargin2darr(a,c);h=a.length;w=a[0].length;i=0;while i<h;a[i].unshift(c);a[i].push(c);i+=1;end;a.unshift(Array.new(w+2,c));a.push(Array.new(w+2,c));return a;end
  
h,w = gInts
a = gCharMat(h)
n = gInt
rce = []

a = addMargin2darr(a,"#")
h += 2
w += 2
sp = [0,0]
tp = [0,0]
for i in 0..(h-1)
  for j in 0..(w-1)
    if a[i][j] == "T"
      tp = [i,j]
    elsif a[i][j] == "S"
      sp = [i,j]
    end
  end
end

es = Array.new(h).map{Array.new(w,-1)}
es[sp[0]][sp[1]] = 0
es[tp[0]][tp[1]] = n+1
sid = -1
rce << [sp[0],sp[1],0]
for i in 1..n
  r,c,e = gInts
  es[r][c] = i
  rce << [r,c,e]
  sid = i if r == sp[0] && c == sp[1]
end
rce << [tp[0],tp[1],0]

if es[sp[0]][sp[1]] < 1
  puts "No"
  exit
end

nxts = Array.new(h+1).map{Array.new(w+1).map{Array.new(0)}}
for y in 1..(h-1)
  for x in 1..(w-1)
    next if a[y][x] == "#"
    nxts[y][x] << [y-1,x] if a[y-1][x] != "#"
    nxts[y][x] << [y+1,x] if a[y+1][x] != "#"
    nxts[y][x] << [y,x-1] if a[y][x-1] != "#"
    nxts[y][x] << [y,x+1] if a[y][x+1] != "#"
  end
end

ds = Array.new(n+2).map{Array.new(n+2,-1)}
si = 1
while si <= n
  sy,sx,se = rce[si]
  lest = n
  vis = Array.new(h).map{Array.new(w,F)}
  que = [[sy,sx,0]]
  vis[sy][sx] = T
  len = 1
  i = 0
  while i < len
    cy,cx,cd = que[i]
    nxts[cy][cx].each do |nxt|
      ny,nx = nxt
      if !vis[ny][nx]
        vis[ny][nx] = T
        que.push([ny,nx,cd+1])
        len += 1
        if es[ny][nx] > 0
          ds[si][es[ny][nx]] = cd+1
        end
      end
    end
    i += 1
  end
  si += 1
end

nds = Array.new(n+2).map{Array.new(0)}
for i in 1..n
  for j in 1..(n+1)
    if i != j && rce[i][2] >= ds[i][j]
      nds[i] << j
    end
  end
end

vis = Array.new(n+2,F)
que = [sid]
vis[sid] = T
len = 1
i = 0
while i < len
  ci = que[i]
  if !nds[ci].empty?
    nds[ci].each do |nxi|
      if !vis[nxi]
        que.push(nxi)
        len += 1
        vis[nxi] = T
      end
    end
  end
  i += 1
end
pYN(vis[n+1])