n = gets.to_i

digicnt = 0
while 10 ** (digicnt+1) <= n
  digicnt += 1
end
cnt = 0
for i in 0..(digicnt - 1)
  if i % 2 == 0
    cnt += 10**(i+1) - 10**i
  end
end
if (digicnt+1) % 2 == 1
  cnt += n - 10 ** digicnt + 1
end
puts cnt