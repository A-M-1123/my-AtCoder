T=true; F=false
def putsTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def putsYN(bool);putsTF(bool,"Yes","No");end
# putsTF(bool, strT, strF) putsYN(bool)
def puts2DArray(arr,part);arr.each{|ae| puts ae.join(part)};end
# puts2DArray(arr,partition)
def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(array)
def addMargin2DArray(a,c);h = a.length;w = a[0].length;for i in 0..(h-1);a[i].unshift(c);a[i].push(c);end;a.unshift(Array.new(w+2,c));a.push(Array.new(w+2,c));return a;end
# addMargin2DArray(arr,char)
def trimPos2DArray(a,c);h=a.length;w=a[0].length;hRng=[0,h-1];wRng=[0,w-1];hExs=Array.new(h,F);wExs=Array.new(w,F);for i in 0..(h-1);for j in 0..(w-1);if a[i][j]==c;hExs[i]=T;wExs[j]=T;end;end;end;for i in 0..(h-1);if hExs[i];hRng[0]=i;break;end;end;for i in 0..(h-1);if hExs[h-1-i];hRng[1]=h-1-i;break;end;end;for i in 0..(w-1);if wExs[i];wRng[0]=i;break;end;end;for i in 0..(w-1);if wExs[w-1-i];wRng[1]=w-1-i;break;end;end;return[hRng,wRng];end; def trim2DArray(a,pos);hRng,wRng=pos;raH=hRng[1]-hRng[0]+1;raW=wRng[1]-wRng[0]+1;retA=Array.new(raH).map{Array.new(raW)};for i in 0..(raH-1);for j in 0..(raW-1);retA[i][j]=a[hRng[0]+i][wRng[0]+j];end;end;return retA;end
# trimPos2DArray(arr,remainMark) trim2DArray(arr,pos):pos...2*2-Array
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

debug = F

h,w = gInts
c = gCharMat(h)

rTps = Array.new(h,0)
cTps = Array.new(w,0)
rCnt = Array.new(h,w)
cCnt = Array.new(w,h)

rTpCnt = Array.new(h).map{Array.new(26,0)}
cTpCnt = Array.new(w).map{Array.new(26,0)}
cord = Hash.new(0)
for i in 0..25
  ch = ("a".ord + i).chr
  cord[ch] = i
end

for i in 0..(h-1)
  tmp = []
  for j in 0..(w-1)
    tmp.push(c[i][j])
    
    order = cord[c[i][j]]
    rTpCnt[i][order] += 1
    cTpCnt[j][order] += 1
  end
  tmp.sort!.uniq!
  rTps[i] = tmp.length
end

for i in 0..(w-1)
  tmp = []
  for j in 0..(h-1)
    tmp.push(c[j][i])
  end
  tmp.sort!.uniq!
  cTps[i] = tmp.length
end

if debug
  puts rCnt.join(" ")
  puts cCnt.join(" ")
  puts rTps.join(" ")
  puts cTps.join(" ")
  puts "==="
end

flag = T
while flag
  flag = F
  
  delR = []
  delRLen = 0
  delRCh = Array.new(25,0)
  delRChOrd = []
  for i in 0..(h-1)
    if rTps[i] == 1 && rCnt[i] > 1
      flag = T
      delR.push(i)
      delRLen += 1
      
      ordi = -1
      for j in 0..25
        if rTpCnt[i][j] == rCnt[i]
          ordi = j
          break
        end
      end
      if 0 <= ordi
        delRCh[ordi] += 1
        delRChOrd.push(ordi)
        rTpCnt[i][ordi] = 0
      else
        puts "err delR:#{i} rCnt#{rCnt[i]}"
      end
    end
  end
  
  delC = []
  delCLen = 0
  delCCh = Array.new(25,0)
  delCChOrd = []
  for i in 0..(w-1)
    if cTps[i] == 1 && cCnt[i] > 1
      flag = T
      delC.push(i)
      delCLen += 1
      
      ordi = -1
      for j in 0..25
        if cTpCnt[i][j] == cCnt[i]
          ordi = j
          break
        end
      end
      if 0 <= ordi
        delCCh[ordi] += 1
        delRChOrd.push(ordi)
        cTpCnt[i][ordi] = 0
      else
        puts "err delC:#{i} cCnt:#{cCnt[i]}"
      end
    end
  end
  
  break if !flag
  
  if delCLen > 0
    delCChOrd.sort!.uniq!
    for i in 0..(h-1)
      rCnt[i] -= delCLen
      rCnt[i] = 0 if rCnt[i] < 0
    end
  end
  if delRLen > 0
    delRChOrd.sort!.uniq!
    for i in 0..(w-1)
      cCnt[i] -= delRLen
      cCnt[i] = 0 if cCnt[i] < 0
    end
  end
  
  if delRLen > 0
    for i in 0..(delRLen-1)
      rCnt[delR[i]] = 0
      rTps[delR[i]] = 0
    end
    
    delRChOrd.each do |ordi|
      delCnt = delRCh[ordi]
      for i in 0..(w-1)
        cTpCnt[i][ordi] -= delCnt
        if cTpCnt[i][ordi] == 0
          cTps[i] -= 1
        end
      end
    end
  end
  
  if delCLen > 0
    for i in 0..(delCLen-1)
      cCnt[delC[i]] = 0
      cTps[delC[i]] = 0
    end
    
    delCChOrd.each do |ordi|
      delCnt = delCCh[ordi]
      for i in 0..(h-1)
        rTpCnt[i][ordi] -= delCnt
        if rTpCnt[i][ordi] == 0
          rTps[i] -= 1
        end
      end
    end
  end
  
  if debug
    puts rCnt.join(" ")
    puts cCnt.join(" ")
    puts rTps.join(" ")
    puts cTps.join(" ")
    puts "==="
  end
end

ans = 0
rCnt.each{|e| ans += e}
puts ans