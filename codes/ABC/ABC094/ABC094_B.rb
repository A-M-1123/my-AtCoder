n, m, x = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
lf = ri = 0
for i in 0..(m-1)
  (a[i] < x) ? (lf += 1):(ri += 1)
end
puts [lf,ri].min