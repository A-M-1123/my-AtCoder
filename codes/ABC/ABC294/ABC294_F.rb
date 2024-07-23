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


class MinHeap
  def initialize(source)
    @arr = []
    source.each do |e|
      push(e)
    end
  end

  def size
    @arr.size
  end

  def empty?
    @arr.empty?
  end

  # ヒープの最小値を返す(削除しない)
  def top
    @arr.first
  end

  # ヒープに値を追加する
  def push(value)
    @arr << value     # 最後尾に追加
    i = @arr.size - 1 # 追加されたノード番号

    # 親子関係を修復していく
    while i > 0
      parent = (i - 1) / 2 # 親のノード番号

      # 親子関係が逆転してなかったら終了
      break if (@arr[parent])[0] <= value[0]

      # 親と自分をswap
      @arr[parent], @arr[i] = @arr[i], @arr[parent]

      i = parent
    end

    # 追加したい値は最終的にこの位置に決定する
    @arr[i] = value
  end

  # ヒープから最小値を取り出す
  def pop
    min = top # 最小値 = 返り値

    # ここからヒープを再構築する
    # ひとまず最後尾をルートノードにもっていくる
    tmp_node = @arr.last
    @arr.pop

    # ルートノードから降ろしていく
    i = 0
    while (i * 2 + 1) < size
      # 左側の子が配列のサイズを超えるまで
      # = 左側の子が配列サイズを超えているということは、
      # そのノードには子が存在しないということになる

      # 左右の子ノードの値を比較して小さい方をmin_childとする
      lhs_child = i * 2 + 1 # 左側の子
      rhs_child = i * 2 + 2 # 右側の子
      min_child = lhs_child # とりあえず左側が小さいと仮定しておく(右側の子が存在しないこともあるため)

      if rhs_child < size
        # 右側の子のインデックスが配列のサイズを超えていないとき
        # = 超えているということは、右側の子は存在しないということ
        # => その場合は左側の子が採用される

        if (@arr[lhs_child])[0] > (@arr[rhs_child])[0]
          min_child = rhs_child
        end
      end

      # 逆転していなければ終了
      break if (@arr[min_child])[0] >= tmp_node[0]

      # 自分のノードを子の値にする
      @arr[i] = @arr[min_child]
      i = min_child
    end

    # 選んだノードは最終的にこの位置に決定(空なら最後の要素だったということなのでセット不要)
    @arr[i] = tmp_node unless empty?

    min
  end
end


CONST = 10**18

debug = F

def calcSynPer(ab,cd)
  sug = ab[0]+cd[0]
  all = sug+ab[1]+cd[1]
  per = 100.0 * sug * CONST / all
  return per
end
def calcPer(ab)
  per = 100.0 * ab[0] * CONST / (ab[0]+ab[1])
  return per
end


n,m,k = gInts
ab = gIntMat(n)
cd = gIntMat(m)

ab.sort!{|x,y| calcPer(y) <=> calcPer(x)}
cd.sort!{|x,y| calcPer(y) <=> calcPer(x)}

abID = Array.new(n,0)
defa = []
for i in 0..(n-1)
  synPer = calcSynPer(ab[i],cd[abID[i]])
  defa.push([-1*synPer,i])
  abID[i] += 1
end
defa.sort!

hp = MinHeap.new(defa)
vals = [] if debug
for i in 1..m*n
  val,id = hp.pop
  if abID[id] < m
    hp.push([-1*calcSynPer(ab[id],cd[abID[id]]),id])
    abID[id] += 1
  end
  vals.push([-1*val/CONST,id]) if debug
  puts -1 * val / CONST if i == k
end
puts vals if debug