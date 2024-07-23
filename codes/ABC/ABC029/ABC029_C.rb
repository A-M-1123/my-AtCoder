def solve(ch, s, i, n)
  s[i] = ch
  if i < n-1
    solve("a", s, i+1, n)
    solve("b", s, i+1, n)
    solve("c", s, i+1, n)
  else
    puts s.join
  end
end

n = gets.to_i

s = Array.new(n)
solve("a", s, 0, n)
s = []
solve("b", s, 0, n)
s = []
solve("c", s, 0, n)