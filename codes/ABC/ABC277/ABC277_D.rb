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

n,m = gInts
a = gInts

aMod = Array.new(n).map{Array.new(2,0)}
for i in 0..(n-1)
  ai = a[i]
  aMod[i] = [ai%m,ai]
end
aMod.sort!{|x,y| (x[0] <=> y[0]).nonzero? || x[1] <=> y[1]}

sect = []
sectLen = 0
sum = aMod[0][1]
for i in 1..(n-1)
  if aMod[i][0] - aMod[i-1][0] > 1
    sect.push(sum)
    sectLen += 1
    sum = aMod[i][1]
  else
    sum += aMod[i][1]
  end
end
if 0 < sectLen && (aMod[n-1][0]+1)%m == aMod[0][0]
  sect[0] += sum
else
  sect.push(sum)
end

if sect.length == 1
  puts 0
else
  sect.sort!{|x,y| y <=> x}
  ans = 0
  sect.each{|e| ans += e}
  ans -= sect[0]
  puts ans
end