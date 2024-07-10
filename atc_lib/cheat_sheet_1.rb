### 二次元配列 ###
# turn2darr(array,dir,angle) ... dir=[:x,:y,:l,:r], angle = 90n // 配列の回転 x,y=回転軸 l,r=中心軸angle度
def turn2darr(a,d,ang);d=d.downcase;return a.reverse if d==:x;return a.map(&:reverse) if d==:y;ang%=360;return nil if ang%90!=0;return a if ang==0;return turn2DArray(a,:l,90) if d==:r&&ang==270;return turn2DArray(a,:r,90) if d==:l&&ang==270;if ang==180;return a.reverse.map(&:reverse);elsif d==:r;return a.transpose.map(&:reverse);elsif d==:l;return a.transpose.reverse;end;return nil;end
# addMargin2darr(arr,char) // 配列arrの周囲にcharを追加
def addMargin2darr(a,c);h=a.length;w=a[0].length;i=0;while i<h;a[i].unshift(c);a[i].push(c);i+=1;end;a.unshift(Array.new(w+2,c));a.push(Array.new(w+2,c));return a;end
# trimPos2darr(arr,mark) trim2DArray(arr,pos):pos...2*2-Array // markを全て含むように最大限配列をトリミング
# trim2DArray(arr,trimPos2darr(arr,mark))
def trimPos2darr(a,c);h=a.length;w=a[0].length;hRng=[0,h-1];wRng=[0,w-1];hExs=Array.new(h,F);wExs=Array.new(w,F);for i in 0..(h-1);for j in 0..(w-1);if a[i][j]==c;hExs[i]=T;wExs[j]=T;end;end;end;for i in 0..(h-1);if hExs[i];hRng[0]=i;break;end;end;for i in 0..(h-1);if hExs[h-1-i];hRng[1]=h-1-i;break;end;end;for i in 0..(w-1);if wExs[i];wRng[0]=i;break;end;end;for i in 0..(w-1);if wExs[w-1-i];wRng[1]=w-1-i;break;end;end;return[hRng,wRng];end; def trim2DArray(a,pos);hRng,wRng=pos;raH=hRng[1]-hRng[0]+1;raW=wRng[1]-wRng[0]+1;retA=Array.new(raH).map{Array.new(raW)};for i in 0..(raH-1);for j in 0..(raW-1);retA[i][j]=a[hRng[0]+i][wRng[0]+j];end;end;return retA;end

### アルゴリズム ###
# binsJust & bins(Just)Over & bins(Just)Under (arr,target,len) // 二分探索 関数名を満たす値の最小/最大のidをreturn
def binsJust(a,t,n);return nil if t<a[0]||a[-1]<t;l,r=0,n-1;while l<=r;m=(l+r)/2;return m if a[m]==t;(a[m]<t)?(l=m+1):(r=m-1);end;return nil;end; def binsJustOver(a,t,n);return nil if a[-1]<t;l,r=0,n;while l<r;m=(l+r)/2;(a[m]<t)?(l=m+1):(r=m);end;return l;end; def binsOver(a,t,n);return nil if a[-1]<=t;l,r=0,n;while l<r;m=(l+r)/2;(a[m]<=t)?(l=m+1):(r=m);end;return l;end; def binsJustUnder(a,t,n);return nil if t<a[0];l,r=0,n-1;rm=0;while l<=r;m=(l+r)/2;(a[m]<=t)?(l=m+1; rm=m if rm<m):(r=m-1);end;return rm;end; def binsUnder(a,t,n);return nil if t<=a[0];l,r=0,n-1;rm=0;while l<=r;m=(l+r)/2;(a[m]<t)?(l=m+1; rm=m if rm<m):(r=m-1);end;return rm;end
# dijkstra(nodeN,nds,startID) // ダイクストラ法 1-index <require:PQueVector>
def dijkstra(n,nds,st); pq=PQueVector.new(2,1); dist=Array.new(n+1,INF); pq.push([st,0]); while (i,d=pq.pop); if dist[i]==INF; dist[i]=d; nds[i].each do |nxt|; pq.push([nxt[0],d+nxt[1]]) if nxt&&dist[nxt[0]]==INF; end; end; end; return dist; end

### 計算 ###
# fracMod(nume,deno,mod) powMod(base,exp,mod) combMod(n,k,mod)
def modInv(a,mod);b=mod;u=1;v=0;while 0<b;t=a/b;a-=t*b;a,b=b,a;u-=t*v;u,v=v,u;end;u%=mod;u+=mod if u<0;return u;end; def fracMod(nu,de,mod);nu%=mod;return nu*modInv(de,mod)%mod;end; def powMod(b,e,mod);res=1;while 0<e;res=(res*b)%mod if e&1>0;b=(b*b)%mod;e=e>>1;end;return res;end; def combMod(n,k,mod);return 1 if k < 1 || n <= k;nu=de=1;i=1;while i <= k;nu=nu*(n-i+1)%mod;de=de*i%mod;i+=1;end;return nu*powMod(de,mod-2,mod)%mod;end

