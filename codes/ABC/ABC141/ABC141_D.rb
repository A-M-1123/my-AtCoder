INF = 9999999999
def prque_pop(n)
  rep = @a[0]
  @a[0] = @a[n-1]
  @a[n-1] = -INF
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


n, m = gets.split.map(&:to_i)
@a = gets.split.map(&:to_i)

@a.sort!{|x, y| y <=> x}

for i in 1..m
  break if @a[0] == 0
  disc = prque_pop(n) / 2
  prque_push(n, disc)
  #puts @a.join(" ")
end

sum = 0
@a.each{|v| sum += v}
puts sum