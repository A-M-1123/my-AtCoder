n = gets.to_i
sb = n.times.map{gets.chomp}
m = gets.to_i
sr = m.times.map{gets.chomp}

ws = Hash.new(0)
sb.each{|wb| ws[wb] += 1}
sr.each{|wr| ws[wr] -= 1}

ans = 0
ws.each{|k,v| ans = [ans,v].max}
puts ans