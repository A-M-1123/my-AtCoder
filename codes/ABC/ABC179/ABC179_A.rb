s = gets.chomp.split("")
if s[-1] == "s"
  puts s.push("es").join
else
  puts s.push("s").join
end