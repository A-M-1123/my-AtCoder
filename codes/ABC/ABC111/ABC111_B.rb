n = gets.to_i
while 1
  if n % 111 == 0
    puts n
    break
  end
  n += 1
end