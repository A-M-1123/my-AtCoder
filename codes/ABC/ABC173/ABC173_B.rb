n = gets.to_i
s = n.times.map{gets.chomp}

jn = ["AC", "WA", "TLE", "RE"]
jud = Hash.new(-1)
jn.each{|e| jud[e] += 1}
s.each{|e| jud[e] += 1}

jn.each do |e|
  puts "#{e} x #{jud[e]}"
end