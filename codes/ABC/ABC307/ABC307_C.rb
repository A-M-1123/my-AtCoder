T=true; F=false
def putsTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end; def putsYN(bool);putsTF(bool,"Yes","No");end
# putsTF(bool, strT, strF) putsYN(bool)
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

def puts2DArray(arr,part)
  arr.each{|ae| puts ae.join(part)}
end

def trimPos2DArray(arr,c)
  h = arr.length
  w = arr[0].length
  hRng = [0,h-1]
  wRng = [0,w-1]
  hExist = Array.new(h,F)
  wExist = Array.new(w,F)
  for i in 0..(h-1)
    for j in 0..(w-1)
      if arr[i][j] == c
        hExist[i] = T
        wExist[j] = T
      end
    end
  end
  for i in 0..(h-1)
    if hExist[i]
      hRng[0] = i
      break
    end
  end
  for i in 0..(h-1)
    if hExist[h-1-i]
      hRng[1] = h-1-i
      break
    end
  end
  for i in 0..(w-1)
    if wExist[i]
      wRng[0] = i
      break
    end
  end
  for i in 0..(w-1)
    if wExist[w-1-i]
      wRng[1] = w-1-i
      break
    end
  end
  return [hRng,wRng]
end

def trim2DArray(arr,pos)
  hRng,wRng = pos
  raH = hRng[1]-hRng[0]+1
  raW = wRng[1]-wRng[0]+1
  retA = Array.new(raH).map{Array.new(raW)}
  for i in 0..(raH-1)
    for j in 0..(raW-1)
      retA[i][j] = arr[hRng[0]+i][wRng[0]+j]
    end
  end
  return retA
end

def puts2DArray(arr,part)
  arr.each{|ae| puts ae.join(part)}
end

ha,wa = gInts
a = gCharMat(ha)
hb,wb = gInts
b = gCharMat(hb)
hx,wx = gInts
x = gCharMat(hx)

aRng = trimPos2DArray(a,"#")
bRng = trimPos2DArray(b,"#")
xRng = trimPos2DArray(x,"#")

aT = trim2DArray(a,aRng)
bT = trim2DArray(b,bRng)
xT = trim2DArray(x,xRng)

aTH = aT.length
aTW = aT[0].length
bTH = bT.length
bTW = bT[0].length
xTH = xT.length
xTW = xT[0].length

if xTH < [aTH,bTH].max || xTW < [aTW,bTW].max
  puts "No"
  exit
end

ans = F
for aHPos in 0..(xTH-aTH)
  for aWPos in 0..(xTW-aTW)
    for bHPos in 0..(xTH-bTH)
      for bWPos in 0..(xTW-bTW)
        newS = Array.new(xTH).map{Array.new(xTW,".")}
        for i in 0..(aTH-1)
          for j in 0..(aTW-1)
            if a[i][j] == "#"
              newS[aHPos+i][aWPos+j] = "#"
            end
          end
        end
        for i in 0..(bTH-1)
          for j in 0..(bTW-1)
            if b[i][j] == "#"
              newS[bHPos+i][bWPos+j] = "#"
            end
          end
        end
        
        match = T
        for i in 0..(xTH-1)
          for j in 0..(xTW-1)
            if xT[i][j] != newS[i][j]
              match = F
              break
            end
          end
          break if !match
        end
        
        if match
          ans = T
          break
        end
      end
      break if ans
    end
    break if ans
  end
  break if ans
end
putsYN(ans)