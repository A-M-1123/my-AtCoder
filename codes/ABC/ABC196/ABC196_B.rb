x = gets.chomp.split('')

xln = x.length
n = Array.new(0)
f = 0
for i in 0..(xln-1)
  if x[i] != '.'
    n.push(x[i])
  else
    break
  end
end

n = n.join.to_i
puts n