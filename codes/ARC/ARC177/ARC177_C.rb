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

def to1d(y,x,w)
  return w*y+x
end
def to2d(n,w)
  y = n/w
  return y,(n-y*w)
end

def solve(n,ids,list,tarID)
  return 0 if tarID == 1
  d = [[1,0],[-1,0],[0,1],[0,-1]]
  
  dist = Array.new(n).map{Array.new(n,INF)}
  que = []
  len = 0
  list[1].each{|e| que << e; len += 1; y,x=to2d(e,n); dist[y][x] = 0}
  i = 0-1
  ans = INF
  while (i += 1) < len
    id = que[i]
    cy,cx = to2d(id,n)
    v = dist[cy][cx]
    j = 0-1
    while (j += 1) < 4
      ny,nx = cy+d[j][0],cx+d[j][1]
      if 0 <= ny && ny < n && 0 <= nx && nx < n
        if ids[ny][nx] == 0
          if v+1 < dist[ny][nx]
            que << to1d(ny,nx,n)
            len += 1
            dist[ny][nx] = v+1
          end
        else
          if ids[ny][nx] == tarID
            ans = v if ans > v
          else
            if v < dist[ny][nx]
              list[ids[ny][nx]].each{|e| que << e; len += 1; y,x=to2d(e,n); dist[y][x] = v}
            end
          end
        end
      end
    end
  end
  # p que
  return ans
end

d = [[1,0],[-1,0],[0,1],[0,-1]]

n = gInt
s = gCharMat(n)

ri = Array.new(n).map{Array.new(n,0)}
bi = Array.new(n).map{Array.new(n,0)}

sy,sx = 0,0
id = 1
bool = T
while bool
  que = [to1d(sy,sx,n)]
  len = 1
  ri[sy][sx] = id
  i = 0-1
  while (i += 1) < len
    cy,cx = to2d(que[i],n)
    j = 0-1
    while (j += 1) < 4
      ny,nx = cy+d[j][0],cx+d[j][1]
      if 0 <= ny && ny < n && 0 <= nx && nx < n
        if s[ny][nx] == 'R' && ri[ny][nx] == 0
          que << to1d(ny,nx,n)
          len += 1
          ri[ny][nx] = id
        end
      end
    end
  end
  while ri[sy][sx] > 0 || s[sy][sx] == 'B'
    sx += 1
    if sx == n
      sy += 1
      sx = 0
      if sy == n
        bool = F
        break
      end
    end
  end
  break if !bool
  id += 1
end
rIDs = id

sy,sx = 0,n-1
id = 1
bool = T
while bool
  que = [to1d(sy,sx,n)]
  len = 1
  bi[sy][sx] = id
  i = 0-1
  while (i += 1) < len
    cy,cx = to2d(que[i],n)
    j = 0-1
    while (j += 1) < 4
      ny,nx = cy+d[j][0],cx+d[j][1]
      if 0 <= ny && ny < n && 0 <= nx && nx < n
        if s[ny][nx] == 'B' && bi[ny][nx] == 0
          que << to1d(ny,nx,n)
          len += 1
          bi[ny][nx] = id
        end
      end
    end
  end
  while bi[sy][sx] > 0 || s[sy][sx] == 'R'
    sx -= 1
    if sx == -1
      sy += 1
      sx = n-1
      if sy == n
        bool = F
        break
      end
    end
  end
  break if !bool
  id += 1
end
bIDs = id

rID = Array.new(rIDs+1).map{Array.new(0)}
bID = Array.new(bIDs+1).map{Array.new(0)}

y = 0-1
while (y += 1) < n
  x = 0-1
  while (x += 1) < n
    if ri[y][x] > bi[y][x]
      rID[ri[y][x]] << to1d(y,x,n)
    else
      bID[bi[y][x]] << to1d(y,x,n)
    end
  end
end

puts solve(n,ri,rID,ri[n-1][n-1]) + solve(n,bi,bID,bi[n-1][0])
