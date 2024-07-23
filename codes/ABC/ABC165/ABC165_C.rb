def solve(num, id, ar)
    ar[id] = num
    if id == @n-1
      sum = 0
      for i in 0..(@q-1)
        sum += @d[i] if ar[@b[i]-1]-ar[@a[i]-1] == @c[i]
      end
      @ans = [@ans, sum].max
      return
    else
      for i in num..@m
        solve(i, id+1, ar)
      end
    end
  end
  
  @n, @m, @q = gets.split.map(&:to_i)
  @a, @b, @c, @d = @q.times.map{gets.split.map(&:to_i)}.transpose
  
  @ans = 0
  ar = Array.new(@n)
  for i in 1..@m
    solve(i, 0, ar)
  end
  puts @ans