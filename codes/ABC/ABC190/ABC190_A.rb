a,b,c = gets.split.map(&:to_i)
nm = ['Takahashi','Aoki']
if c == 0
  a <= b ? (puts nm[1]):(puts nm[0])
else
  a >= b ? (puts nm[0]):(puts nm[1])
end