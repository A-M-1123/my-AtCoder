n = gets.to_i
a = gets.split.map(&:to_i)

tor = Array.new(2**n,0)
for i in 0..(2**n-1)
  tor[i] = i+1
end

rd = 1
st = 0
while rd < n
  for i in 0..2**(n-rd)-1
    if a[tor[st+i*2]-1] > a[tor[st+i*2+1]-1]
      tor.push(tor[st+i*2])
    else
      tor.push(tor[st+i*2+1])
    end
  end
  st += 2**(n-rd+1)
  rd += 1
end

if a[tor[-1]-1] > a[tor[-2]-1]
  puts tor[-2]
else
  puts tor[-1]
end