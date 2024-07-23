def pArray(a,ifBtw)
  (ifBtw) ? (btw = " "):(btw = "")
  len = a.length
  for i in 0..(len-1)
    puts a[i].join(btw)
  end
end
def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(a)
T=true;F=false;def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i+1].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(n,m,a,1way?,wgt?,lbl?,tree?) template -- makeNds(n,m,a,F,F,F,F)
def bins(a,t,st,en);if st>en;puts "Err...bins: st>en";exit;end;m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m])?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# bins(a,tar,0,n-1)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(a) calcPFSum(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

n = getInt
s = getCharMat(n)
t = getCharMat(n)

v = Hash.new(0)
v["#"] = 1
v["."] = 0

st = Array.new(2).map{Array.new(2,-1)}  # [s[yoko,tate], t[yoko,tate]]
en = Array.new(2).map{Array.new(2,-1)}  # [s[yoko,tate], t[yoko,tate]]
for sti in 0..1
  for i in 0..(n-1)
    stcnt = [0,0]
    encnt = [0,0]
    for j in 0..(n-1)
      (sti == 0) ? (yoko,tate = s[i][j],s[j][i]):(yoko,tate = t[i][j],t[j][i])
      stcnt[0] += 1 if v[yoko] == 1
      stcnt[1] += 1 if v[tate] == 1
      (sti == 0) ? (yoko,tate = s[n-1-i][n-1-j],s[n-1-j][n-1-i]):(yoko,tate = t[n-1-i][n-1-j],t[n-1-j][n-1-i])
      encnt[0] += 1 if v[yoko] == 1
      encnt[1] += 1 if v[tate] == 1
    end
    for j in 0..1
      if st[sti][j] == -1
        st[sti][j] = i if stcnt[j] > 0
      end
      if en[sti][j] == -1
        en[sti][j] = n-1-i if encnt[j] > 0
      end
    end
  end
end

saw,sah = en[0][1]-st[0][1]+1, en[0][0]-st[0][0]+1
taw,tah = en[1][1]-st[1][1]+1, en[1][0]-st[1][0]+1
sa = Array.new(sah).map{Array.new(saw)}
ta = Array.new(tah).map{Array.new(taw)}
for y in 0..(sah-1)
  for x in 0..(saw-1)
    sa[y][x] = s[y+st[0][0]][x+st[0][1]]
  end
end
for y in 0..(tah-1)
  for x in 0..(taw-1)
    ta[y][x] = t[y+st[1][0]][x+st[1][1]]
  end
end

if (saw == taw && sah == tah) || (saw == tah && sah == taw)
  ta = ta.transpose if !(saw == taw && sah == tah)
  taop = copyArray(ta)
  chk = Array.new(sah).map{Array.new(saw,F)}
  for y in 0..(sah-1)
    for x in 0..(saw-1)
      if !chk[y][x]
        tmp = taop[y][x]
        taop[y][x] = taop[sah-1-y][saw-1-x]
        taop[sah-1-y][saw-1-x] = tmp
        chk[y][x] = T
        chk[sah-1-y][saw-1-x] = T
      end
    end
  end
  (sa == ta || sa == taop) ? (puts "Yes"):(puts "No")
else
  puts "No"
end