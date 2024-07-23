T=true; F=false
def putsTF(bool,strT,strF);(bool)?(puts strT):(puts strF);end
# putsTF(bool, strT, strF)
def copyArray(a);return Marshal.load(Marshal.dump(a));end
# copyArray(array)
def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTree);nds=Array.new(n+1).map{Array.new(0)};for i in 0..(m-1);id1=a[i][0];id2=a[i][1];w=a[i][2]if ifWgt;if !ifWgt&&!ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed)if !if1way;end;end;n.times{|i|nds[i+1].push(-1)}if if1way||!ifTree;return nds;end
# makeNds(ndN,arrL,array,1way?,wgt?,lbl?,tree?) template--makeNds(n,m,a,F,F,F,F)
def getPFSum(a);l=a.length;r=Array.new(l+1,0);for i in 0..(l-1);r[i+1]=r[i]+a[i];end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(array) calcPFSum(array,st,en)
def gInt();gets.to_i;end; def gInts();gets.split.map(&:to_i);end; def gIntMat(n);n.times.map{gInts()};end; def gIntVars(n);gIntMat(n).transpose;end
# g...Int Ints IntMat(n) IntVars(n)
def gStrs();gets.chomp.split;end; def gCharsDiv();gets.chomp.split("");end; def gCharMat(n);n.times.map{gets.chomp.split("")};end; def gStrsVert(n);n.times.map{gets.chomp};end
# g...Strs CharsDiv CharMat(n) StrsVert(n)

def bins(arr,tar,st,en,len,maxv,mode)
  m = (st+en) / 2
  if mode == "S"
    return arr[en] if arr[en] < tar
    if tar < arr[st]
      if st == 0
        return 0
      else
        return arr[st-1]
      end
    end
    if st == en || st+1 == en
      if arr[st] < tar && (st == len-1 || tar < arr[st+1])
        return st
      elsif st < len-1 && arr[st+1] < tar
        return st+1
      else
        return st-1
      end
    end
  elsif mode == "L"
    return arr[st] if tar < arr[st]
    if arr[en] < tar
      if en == len-1
        return maxv+1
      else
        return arr[en+1]
      end
    end
    if st == en || st+1 == en
      if tar < arr[en] && (en == 0 || arr[en-1] < tar)
        return en
      elsif en > 0 && tar < arr[en-1]
        return en-1
      else
        return en+1
      end
    end
  end
  (tar < arr[m]) ? (s,e = st,m-1):(s,e = m+1,en)
  return bins(arr,tar,s,e,len,maxv,mode)
end

h,w,rs,cs = gInts
n = gInt
rc = gIntMat(n)
q = gInt
dl = q.times.map{gets.chomp.split}

rows = Hash.new(0) # key:col
cols = Hash.new(0) # key:row
for i in 0..(n-1)
  row,col = rc[i]
  rows[col] = [] if !rows.has_key?(col)
  rows[col].push(row)
  cols[row] = [] if !cols.has_key?(row)
  cols[row].push(col)
end
rows.each do |k,v|
  rows[k] = v.sort
end
cols.each do |k,v|
  cols[k] = v.sort
end

row,col = rs,cs
for i in 0..(q-1)
  dir = dl[i][0]
  leng = dl[i][1].to_i
  
  wall = -1
  if dir == "L"
    if cols.has_key?(row)
      colArr = cols[row]
      colArrLen = colArr.length
      wall = bins(colArr,col,0,colArrLen-1,colArrLen,w,"S")
    else
      wall = 0
    end
    col = [wall+1,col-leng].max
  elsif dir == "R"
    if cols.has_key?(row)
      colArr = cols[row]
      colArrLen = colArr.length
      wall = bins(colArr,col,0,colArrLen-1,colArrLen,w,"L")
    else
      wall = w+1
    end
    col = [wall-1,col+leng].min
  elsif dir == "U"
    if rows.has_key?(col)
      rowArr = rows[col]
      rowArrLen = rowArr.length
      wall = bins(rows[col],row,0,rowArrLen-1,rowArrLen,h,"S")
    else
      wall = 0
    end
    row = [wall+1,row-leng].max
  elsif dir == "D"
    if rows.has_key?(col)
      rowArr = rows[col]
      rowArrLen = rowArr.length
      wall = bins(rows[col],row,0,rowArrLen-1,rowArrLen,h,"L")
    else
      wall = h+1
    end
    row = [wall-1,row+leng].min
  end
  puts "#{row} #{col}"
end