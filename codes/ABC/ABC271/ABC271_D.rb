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

def putsAns(n,th)
  puts "Yes"
  ans = ""
  for i in 0..(n-1)
    if th[i]
      ans += "T"
    else
      ans += "H"
    end
  end
  puts ans
end

n,s = gInts
a,b = gIntVars(n)

th = Array.new(n,T)
delta = Array.new(n,0)
sum = 0
for i in 0..(n-1)
  th[i] = (a[i] <= b[i])
  delta[i] = (a[i]-b[i]).abs
  sum += [a[i],b[i]].min
end

if sum == s
  putsAns(n,th)
elsif sum < s
  tar = s-sum
  dp = Array.new(tar+1).map{Array.new(n,F)}  
  for i in 1..tar
    for j in 0..(n-1)
      dlt = delta[j]
      if j == 0
        dp[i][j] = T if i == dlt
      else
        dp[i][j] = T if i == dlt || dp[i][j-1] || (dlt < i && dp[i-dlt][j-1])
      end
    end
  end
  # tar.times{|i| puts "#{i+1} : #{dp[i+1].join(" ")}"}
  flag = F
  id = 0
  for i in 0..(n-1)
    if dp[tar][i]
      flag = T
      id = i
      break
    end
  end
  if flag
    tarTmp = tar
    dID = []
    while 0 <= id
      if dp[tarTmp][id] && (id == 0 || !dp[tarTmp][id-1])
        dID.push(id)
        tarTmp -= delta[id]
      end
      id -= 1
    end
    dID.each{|e| th[e] = !th[e]}
    putsAns(n,th)
  else
    puts "No"
  end
else
  puts "No"
end