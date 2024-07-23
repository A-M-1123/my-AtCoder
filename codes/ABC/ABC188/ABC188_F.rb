def solve(x,y)
    dlt = (x-y).abs
    if y == 1
      return dlt
    else
      if y % 2 == 0
        (@slv.key?(y/2)) ? (cmp = @slv[y/2]):(cmp = solve(x,y/2))
        rep = [dlt, cmp+1].min
        @slv[y] = rep
        return rep
      else
        (@slv.key?((y-1)/2)) ? (cmp1 = @slv[(y-1)/2]):(cmp1 = solve(x,(y-1)/2))
        (@slv.key?((y+1)/2)) ? (cmp2 = @slv[(y+1)/2]):(cmp2 = solve(x,(y+1)/2))
        rep = [dlt, cmp1+2, cmp2+2].min
        @slv[y] = rep
        return rep
      end
    end
  end
  
  x,y = gets.split.map(&:to_i)
  
  @slv = Hash.new(0)
  @slv[1] = (x-1).abs
  puts solve(x,y)