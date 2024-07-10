def judSlope(xy0,xy1)
  # increase:1, decrease:-1, horizontal:9, vertical:-9, same:0
  cond = [1,-1,9,-9,0]
  if xy0.length != 2 || xy1.length != 2
    STDERR.puts "method judSlope() requires double 2-length array."
  end
  if xy0[0] == xy1[0]
    return cond[4] if xy0[1] == xy1[1]
    return cond[3]
  elsif xy0[1] == xy1[1]
    return cond[2]
  else
    if 0 < (xy0[0]-xy1[0])*(xy0[1]-xy1[1])
      return cond[0]
    else
      return cond[1]
    end
  end
end
