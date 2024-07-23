n = gets.to_i
s = n.times.map{gets.chomp}

rw = Hash.new(0)
s.each{|nm| rw[nm] += 1}
cnt = 0
rw.each{|k,v| cnt += 1}
puts cnt