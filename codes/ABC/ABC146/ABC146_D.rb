def tree_col(id, preid, precol)
    col = 1
    @nd[id].each do |ndn|
      if ndn[0] != preid && @cols[ndn[1]] < 0
        col += 1 if col == precol
        @cols[ndn[1]] = col
        tree_col(ndn[0], id, col)
        col += 1
      end
    end
  end
  
  n = gets.to_i
  a = (n-1).times.map{gets.split.map(&:to_i)}
  
  @nd = Array.new(n+1).map{Array.new(0)}
  for i in 0..(n-2)
    @nd[a[i][0]].push([a[i][1], i])
    @nd[a[i][1]].push([a[i][0], i])
  end
  
  @cols = Array.new(n-1, -1)
  tree_col(1, 0, 0)
  
  max = 0
  @cols.each{|c| max = [max, c].max}
  puts max
  @cols.each{|c| puts c}
  