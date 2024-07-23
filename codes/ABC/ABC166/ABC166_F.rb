def dfs(cnt, max, a, b, c)
  if cnt > max
    rep = Array.new(max, 0)
    return rep
  end
  
  rep1 = rep2 = -1
  if @s[cnt-1] == "AB"
    if a == 0 && b == 0
      return -1
    else
      rep1 = dfs(cnt+1, max, a+1, b-1, c) if b > 0
      rep2 = dfs(cnt+1, max, a-1, b+1, c) if a > 0 && rep1 == -1
    end
  elsif @s[cnt-1] == "BC"
    if b == 0 && c == 0
      return -1
    else
      rep1 = dfs(cnt+1, max, a, b+1, c-1) if c > 0
      rep2 = dfs(cnt+1, max, a, b-1, c+1) if b > 0 && rep1 == -1
    end
  else
    if a == 0 && c == 0
      return -1
    else
      rep1 = dfs(cnt+1, max, a+1, b, c-1) if c > 0
      rep2 = dfs(cnt+1, max, a-1, b, c+1) if a > 0 && rep1 == -1
    end
  end
  
  if rep1 != -1 || rep2 != -1
    if rep1 != -1
      rep = rep1.dup
      id = 0
    else
      rep = rep2.dup
      id = 1
    end
    rep[cnt-1] = id
    return rep
  else
    return -1
  end
end

n, a, b, c = gets.split.map(&:to_i)
@s = n.times.map{gets.chomp}

rep = Array.new(n)
ans = dfs(1, n, a, b, c)

if ans == -1
  puts "No"
else
  puts "Yes"
  for i in 0..(n-1)
    cs = @s[i].split("")
    puts cs[ans[i]]
  end
end