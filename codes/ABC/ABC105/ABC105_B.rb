n = gets.to_i

flag = 0
for cak in 0..(n/4)
  for don in 0..(n/7)
    if cak*4 + don*7 == n
      flag = 1
      break
    end
  end
end
flag == 1 ? (puts "Yes") : (puts "No")