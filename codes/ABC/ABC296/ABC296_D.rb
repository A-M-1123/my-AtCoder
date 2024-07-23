require 'prime'

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

class Prime
    def each_divisor(n, &block)
        pf = prime_division(n)
        num = -> { pf.inject(1) { |prod, (_, exp)| prod * exp.succ } }
        Enumerator.new(num) { |y| __each_divisor__(1, pf, &y.method(:<<)) }
                  .tap { |enum| enum.each(&block) }
    end

    private def __each_divisor__(d, ary, &block)
        return yield(d) if ary.empty?

        ary = ary.dup
        prime, exp = ary.pop
        0.upto(exp) { __each_divisor__(d, ary, &block); d *= prime }
    end
end

def solve(st,en,arr,tar)
  return en if arr[en] <= tar
  return st-1 if tar < arr[st]
  return st if st == en
  mid = (st+en)/2
  return mid if arr[mid] == tar
  if tar < arr[mid]
    return solve(st,mid-1,arr,tar)
  else
    return solve(mid+1,en,arr,tar)
  end
end

n,m = gInts

pi = Prime.instance

if n**2 < m
  puts -1
elsif m <= n
  puts m
else
  aMin = (m**0.5).to_i
  xs = []
  for a in 1..[10**6,n].min
    if m % a == 0 && m / a <= n
      xs.push(m)
      break
    else
      b = (m/a).to_i + 1
      if b <= n
        x = a*b
        xs.push(x)
      end
    end
  end
  xs.sort!
  puts xs[0]
end