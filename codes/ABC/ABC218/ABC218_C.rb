T=true; F=false; INF=9999999999999 # 10**13-1
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
def getDigitLen(n);n=n.abs;return 1 if n==0;return Math.log10(n).to_i+1;end; def getNumApart(n);d=[];begin;d.unshift(n%10);n/=10;end while n>0;return d;end
def to1d(y,x,w); return y*w+x; end;  def to2d(n,w); return (n / w),(n % w); end
def nC2(n); return 0 if n<2; return n*(n-1)/2; end;  def sumStep(n); return 0 if n<1; return n*(n+1)/2; end;  def count0011(w,i); blc = n/(w << 1); ret = blc*w; n -= blc*(w << 1)+w-1; ret+=n if 0<n; return ret; end
def sort2darr(a);a.sort!{|x,y|(x[0]<=>y[0]).nonzero?||x[1]<=>y[1]};end
def copyArr(a);return Marshal.load(Marshal.dump(a));end
def pTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def pYN(bool);pTF(bool,"Yes","No");end
def p2darr(arr,part);arr.each{|ae| puts ae.join(part)};end
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# makeNds(ndN,edgeN,edgeArr,1way?,wgt?,lbl?,spanning?) <ex.makeNds(n,m,a,F,F,F,T)>
# getDigitLen(num) # getNumApart(num) <ex.4275=>[4,2,7,5]>
# to1d(y,x,w) to2d(n,w) <w = width>
# nCn(n) # sumStep(n) <sum(1..n)> # count0011(w,i) <0-index>
# sort2darr(array) <for 2*2-array>
# copyArr(array)
# p...TF(bool,strT,strF) YN(bool) 2darr(arr,partition)
# g...Int Ints IntMat(n) IntVars(n)
# g...Strs CharsDiv CharMat(n) StrsVert(n)

# trimPos2darr(arr,mark) trim2DArray(arr,pos):pos...2*2-Array // markを全て含むように最大限配列をトリミング
# trim2DArray(arr,trimPos2darr(arr,mark))
def trimPos2darr(a,c);h=a.length;w=a[0].length;hRng=[0,h-1];wRng=[0,w-1];hExs=Array.new(h,F);wExs=Array.new(w,F);for i in 0..(h-1);for j in 0..(w-1);if a[i][j]==c;hExs[i]=T;wExs[j]=T;end;end;end;for i in 0..(h-1);if hExs[i];hRng[0]=i;break;end;end;for i in 0..(h-1);if hExs[h-1-i];hRng[1]=h-1-i;break;end;end;for i in 0..(w-1);if wExs[i];wRng[0]=i;break;end;end;for i in 0..(w-1);if wExs[w-1-i];wRng[1]=w-1-i;break;end;end;return[hRng,wRng];end; def trim2DArray(a,pos);hRng,wRng=pos;raH=hRng[1]-hRng[0]+1;raW=wRng[1]-wRng[0]+1;retA=Array.new(raH).map{Array.new(raW)};for i in 0..(raH-1);for j in 0..(raW-1);retA[i][j]=a[hRng[0]+i][wRng[0]+j];end;end;return retA;end
# turn2darr(array,dir,angle) ... dir=[:x,:y,:l,:r], angle = 90n // 配列の回転 x,y=回転軸 l,r=中心軸angle度
def turn2darr(a,d,ang);d=d.downcase;return a.reverse if d==:x;return a.map(&:reverse) if d==:y;ang%=360;return nil if ang%90!=0;return a if ang==0;return turn2darr(a,:l,90) if d==:r&&ang==270;return turn2darr(a,:r,90) if d==:l&&ang==270;if ang==180;return a.reverse.map(&:reverse);elsif d==:r;return a.transpose.map(&:reverse);elsif d==:l;return a.transpose.reverse;end;return nil;end

n = gInt
s = gCharMat(n)
t = gCharMat(n)

s = trim2DArray(s, trimPos2darr(s,'#'))
t = trim2DArray(t, trimPos2darr(t,'#'))

bool = F
for i in 0..3
  if s == turn2darr(t,:r,90*i)
    bool = T
    break
  end
end

pYN(bool)