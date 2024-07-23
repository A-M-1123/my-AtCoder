n = gets.to_i
h = gets.split.map(&:to_i)

dh = Array.new(n)
dh[0] = 0
for i in 1..(n-1)
  dh[i] = h[i] - h[i-1]
end

flag = 1
sum = 0
for i in 0..(n-1)
  if dh[i] <= -2
    flag = 0
    break
  elsif dh[i] == -1
    sum += dh[i]
    if sum <= -2
      flag = 0
      break
    end
  elsif dh[i] >= 1
    sum = 0
  end
end
if flag == 1
  puts "Yes"
else
  puts "No"
end