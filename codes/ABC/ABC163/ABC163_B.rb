n, m = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)
sum = 0
a.each{|an| sum+=an}
(sum <= n) ? (puts n-sum):(puts -1)