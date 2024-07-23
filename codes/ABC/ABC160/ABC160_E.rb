x, y, a, b, c = gets.split.map(&:to_i)
p = gets.split.map(&:to_i)
q = gets.split.map(&:to_i)
r = gets.split.map(&:to_i)
p.sort!{|i,j| j<=>i}
q.sort!{|i,j| j<=>i}
r.sort!{|i,j| j<=>i}

pid = x-1
qid = y-1
for i in 0..(c-1)
  break if p[pid] > r[i] && q[qid] > r[i]
  if p[pid] < q[qid]
    p[pid] = r[i]
    pid -= 1 if pid > 0
  else
    q[qid] = r[i]
    qid -= 1 if qid > 0
  end
end
sum = 0
for i in 0..(x-1)
  sum += p[i]
end
for i in 0..(y-1)
  sum += q[i]
end
puts sum