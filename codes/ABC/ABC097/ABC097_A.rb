a,b,c,d = gets.split.map(&:to_i)
(a-c).abs <= d || ((a-b).abs <= d && (b-c).abs <= d) ? (puts "Yes"):(puts "No")