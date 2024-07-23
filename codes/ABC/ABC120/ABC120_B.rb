a, b, k = gets.chomp.split.map(&:to_i)
cnt = 0
num = b
while cnt != k
  if a % num == 0 && b % num == 0
    cnt += 1
    if cnt == k
      puts num
      break
    end
  end
  num -= 1
end