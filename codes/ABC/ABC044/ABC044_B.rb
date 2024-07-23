cnt = Hash.new(0)
s = gets.chomp.split("")
s.each do |ch|
  cnt[ch] += 1
end
flag = 0
cnt.each do |key, num|
  if num % 2 == 1
    puts "No"
    flag += 1
    break
  end
end
if flag == 0
  puts "Yes"
end