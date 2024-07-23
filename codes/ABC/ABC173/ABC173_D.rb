n = gets.to_i
a = gets.split.map(&:to_i)

a.sort!{|x,y| y<=>x}

ans = a[0]
for i in 3..n
  ans += a[(i-1)/2]
end
puts ans