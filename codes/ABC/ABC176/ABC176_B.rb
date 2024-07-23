n = gets.chomp.split("")
ans = 0
n.each{|e| ans = (ans + e.to_i) % 9}
(ans % 9 == 0) ? (puts "Yes"):(puts "No")