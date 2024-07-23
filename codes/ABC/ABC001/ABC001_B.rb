m = gets.chomp.to_i
if m < 100
  puts "00"
elsif m <= 5000
  vv = m * 10 / 1000
  if vv < 10
    puts "0#{vv}"
  else
    puts vv
  end
elsif m <= 30000
  vv = m / 1000 + 50
  puts vv
elsif m <= 70000
  vv = (m / 1000 - 30) / 5 + 80
  puts vv
else
  puts 89
end