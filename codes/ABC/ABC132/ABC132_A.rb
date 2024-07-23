s = gets.chomp.split("")
cs = Hash.new(0)
cnt = 0
flag = 1

s.each do |c|
  cs[c] += 1
end

cs.each do |k,v|
  if v != 2
    flag = 0
    break
  end
  cnt += 1
end

if cnt == 2 && flag == 1
  puts "Yes"
else
  puts "No"
end