def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(a)
T=true;F=false;def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(n,m,a,1way?,wgt?,lbl?,tree?) template -- makeNds(n,m,a,F,F,F,F)
def bins(a,t,st,en);if st>en;puts "Err...bins: st>en";exit;end;m=(st+en)/2;return m if t==a[m];return-1if st==en||t<a[st]||a[en]<t;(t<a[m])?(s,e=st,m-1):(s,e=m+1,en);return bins(a,t,s,e);end
# bins(a,tar,0,n-1)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(a) calcPFSum(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

INF = 9999999999999999
def prque_pop(n)
  rep = @a[0]
  @a[0] = @a[n-1]
  @a[n-1] = INF
  id = 0
  while 1
    if 2*id+1 < n-1
      lft = 2*id+1
      (2*id+2 < n-1) ? (rit = 2*id+2):(rit = lft)
      if @a[id] <= @a[lft] || @a[id] <= @a[rit]
        (@a[lft] >= @a[rit]) ? (swp = lft):(swp = rit)
        tmp = @a[id]
        @a[id] = @a[swp]
        @a[swp] = tmp
        id = swp
      else
        break
      end
    else
      break
    end
  end
  return rep
end

def prque_push(n, v)
  @a[n-1] = v
  id = n-1
  while 1
    cmp = (id-1)/2
    if id > 0 && @a[id] > @a[cmp]
      tmp = @a[id]
      @a[id] = @a[cmp]
      @a[cmp] = tmp
      id = cmp
    else
      break
    end
  end
end

q = getInt

@a = Array.new(q,INF)
len = 0
mns = 0

ans = Array.new(0)
q.times do |i|
  qr = getInts
  if qr[0] == 1
    len += 1
    prque_push(len, -1*(qr[1]-mns))
  elsif qr[0] == 2
    mns += qr[1]
  elsif qr[0] == 3
    pops = prque_pop(len)
    ans.push(pops*-1+mns)
    len -= 1
  end
end
ans.each{|e| puts e}