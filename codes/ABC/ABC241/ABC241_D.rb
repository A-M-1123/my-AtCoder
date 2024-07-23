def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(a)
T=true;F=false;def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i+1].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(n,m,a,1way?,wgt?,lbl?,tree?) template -- makeNds(n,m,a,F,F,F,F)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(a) calcPFSum(a,s,e)
def getInt();gets.to_i;end; def getInts();gets.split.map(&:to_i);end; def getIntMat(n);n.times.map{gets.split.map(&:to_i)};end; def getIntMatVars(n);getIntMat(n).transpose;end; def getChars();gets.chomp.split("");end; def getCharMat(n);n.times.map{gets.chomp.split("")};end; def getStrs(n);n.times.map{gets.chomp};end; def getQuery(r,c,t);return[]if c!=t.length;a=r.times.map{gets.chomp.split};return a if t.uniq==[0];for i in 0..(c-1);next if t[i]==0;for j in 0..(r-1);(t[i]==1)?(a[j][i]=a[j][i].to_i):(a[j][i]=a[j][i].to_f);end;end;return a;end
# get...Int Ints IntMat(n) IntMatVars(n) Chars CharMat(n) Strs(n) Query(r,c,[s0/i1/f2])

def bins(tar,a,st,en,len)
  mid = (st+en)/2
  return mid if tar == mid
  if st == en
    if a[st] < tar && (st == len-1 || tar < a[st+1])
      return st
    elsif tar < a[st] && a[st-1] < tar
      return st-1
    else
      return st+1
    end
  end
  if tar < a[mid]
    return bins(tar,a,st,mid-1,len)
  else
    return bins(tar,a,mid+1,en,len)
  end
end

a = []
len = 0
qn = getInt
q = qn.times.map{getInts}

for i in 0..(qn-1)
  cmd = q[i][0]
  if cmd == 1
    a.push(q[i][1])
    a.sort!
    len += 1
  elsif cmd == 2
    x,k = q[i][1],q[i][2]
    if len < k || x < a[0]
      puts -1
    elsif a[-1] <= x
      puts a[-1*k]
    else
      rep = bins(x,a,0,len-1,len)
      id = rep+1-k
      if 0 <= id && id < len
        puts a[id]
      else
        puts -1
      end
    end
  elsif cmd == 3
    x,k = q[i][1],q[i][2]
    if len < k || a[-1] < x
      puts -1
    elsif x <= a[0]
      puts a[k-1]
    else
      rep = bins(x,a,0,len-1,len)
      id = rep+k
      if 0 <= id && id < len
        puts a[id]
      else
        puts -1
      end
    end
  end
end
