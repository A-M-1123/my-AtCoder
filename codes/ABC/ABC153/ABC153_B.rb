h, n = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
sum = 0
a.each{|at| sum += at}
(sum >= h) ? (puts "Yes"):(puts "No")