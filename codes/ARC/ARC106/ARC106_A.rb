n = gets.to_i

ans = [-1,-1]
for b in 1..25
  break if 5**b >= n
  d = n - 5**b
  a = -1
  for an in 1..37
    break if 3**an > d
    if d == 3**an
      a = an
      break
    end
  end
  if a >= 1
    ans = [a,b]
    break
  end
end

if ans[0] == -1
  puts -1
else
  puts "#{ans[0]} #{ans[1]}"
end