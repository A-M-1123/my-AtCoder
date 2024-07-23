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

def isIn(l,v,r)
  return (l <= v && v <= r)
end

def to1d(y,x,w)
  return y*w+x
end
def to2d(n,w)
  y = n/w
  return y,(n-y*w)
end

h,w = gInts
s = gCharMat(h)

ds = [[-1,0],[1,0],[0,-1],[0,1]]
isFree = Array.new(h).map{Array.new(w,T)}
isStick = Array.new(h).map{Array.new(w,F)}
for y in 0..(h-1)
  for x in 0..(w-1)
    if s[y][x] == '#'
      isFree[y][x] = F
      for i in 0..3
        cy = y+ds[i][0]
        cx = x+ds[i][1]
        if isIn(0,cy,h-1) && isIn(0,cx,w-1)
          isFree[cy][cx] = F
          isStick[cy][cx] = T
        end
      end
    end
  end
end

sy = sx = 0
while sy < h && !isFree[sy][sx]
  sx += 1
  if sx == w
    sy += 1
    sx = 0
  end
end

ans = 1
while sy < h
  que = [to1d(sy,sx,w)]
  len = 1
  isFree[sy][sx] = F
  vis = Hash.new()
  vis[to1d(sy,sx,w)] = T
  cnt = 1
  i = 0-1
  while (i += 1) < len
    cy,cx = to2d(que[i],w)
    for j in 0..3
      ny = cy+ds[j][0]
      nx = cx+ds[j][1]
      if isIn(0,ny,h-1) && isIn(0,nx,w-1)
        nid = to1d(ny,nx,w)
        if !vis[nid]
          vis[nid] = T
          if isFree[ny][nx]
            que << nid
            len += 1
            isFree[ny][nx] = F
            cnt += 1
          elsif isStick[ny][nx]
            cnt += 1
          end
        end
      end
    end
  end
  ans = cnt if ans < cnt
  while sy < h && !isFree[sy][sx]
    sx += 1
    if sx == w
      sy += 1
      sx = 0
    end
  end
end
puts ans