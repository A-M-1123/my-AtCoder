s = gets.chomp.split("")
dir = [["R", "U", "D"], ["L", "U", "D"]]
flag = 1
id = 0
s.each do |c|
  tmpflag = 0
  dir[id%2].each do |d|
    if c == d
      tmpflag = 1
      break
    end
  end
  if tmpflag == 0
    flag = 0
    break
  end
  id += 1
end
if flag == 1
  puts "Yes"
else
  puts "No"
end