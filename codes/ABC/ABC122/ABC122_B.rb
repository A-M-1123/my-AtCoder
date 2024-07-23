s = gets.chomp.split("")
cnt = max = 0
s.each do |ch|
  if ch == "A" || ch == "C" || ch == "G" || ch == "T"
    cnt += 1
  else
    if cnt > max
      max = cnt
    end
    cnt = 0
  end
end
if cnt > max
  max = cnt
end
puts max
  
