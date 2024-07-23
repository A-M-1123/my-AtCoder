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

H,W,N,h,w = gInts
A = gIntMat(H)

maxN = 0
A.each{|ae| ae.each{|e| maxN = [maxN, e].max}}
cnt = Array.new(maxN+1,0)
A.each{|ae| ae.each{|e| cnt[e] += 1}}
ans = 0
for i in 1..maxN
  ans += 1 if 0 < cnt[i]
end
ansAr = Array.new(H-h+1).map{Array.new(W-w+1,0)}

for i in 0..(h-1)
  for j in 0..(w-1)
    num = A[i][j]
    cnt[num] -= 1
    ans -= 1 if cnt[num] == 0
  end
end
ansAr[0][0] = ans

for i in 0..(H-h)
  for j in 0..(W-w)
    y = i
    (y % 2 == 0) ? (x = j):(x = W-w-j)
    if j == 0 && 0 < i
      preY = y-1
      nxtY = y-1+h
      for k in x..(x+w-1)
        cnt[A[preY][k]] += 1
        ans += 1 if cnt[A[preY][k]] == 1
        cnt[A[nxtY][k]] -= 1
        ans -= 1 if cnt[A[nxtY][k]] == 0
      end
    elsif 0 < j
      (i % 2 == 0) ? (preX,nxtX = x-1,x-1+w):(preX,nxtX = x+w,x)
      for k in y..(y+h-1)
        cnt[A[k][preX]] += 1
        ans += 1 if cnt[A[k][preX]] == 1
        cnt[A[k][nxtX]] -= 1
        ans -= 1 if cnt[A[k][nxtX]] == 0
      end
    end
    ansAr[y][x] = ans
  end
end
    
for i in 0..(H-h)
  puts ansAr[i].join(" ")
end