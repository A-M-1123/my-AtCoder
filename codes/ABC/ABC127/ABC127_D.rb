n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
b = Array.new(m).map{Array.new(2)}
for i in 0..(m-1)
  b[i] = gets.split.map(&:to_i)
end

a.sort!
b.sort!{|x,y| y[1]<=>x[1]}
aid = bid = 0
res = b[bid][0]
while aid < n && bid < m
  if a[aid] < b[bid][1]
    a[aid] = b[bid][1]
  end
  aid += 1
  res -= 1
  if res <= 0
    bid += 1
    bid < m ? res = b[bid][0] : break
  end
end
sum = 0
a.each{|an| sum += an}
puts sum