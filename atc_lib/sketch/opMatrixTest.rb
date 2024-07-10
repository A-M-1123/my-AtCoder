h,w = gets.split.map(&:to_i)
mat = h.times.map{gets.split.map(&:to_i)}
q = gets.to_i

om = OpMatrix.new(mat)

om.viewMatrix()
for i in 0..(q-1)
  line = gets.split.map(&:to_i)
  if line[0] == 1
    om.rSwap(line[1]-1,line[2]-1)
    puts "== row #{line[1]}<=>#{line[2]} ===="
  elsif line[0] == 2
    om.cSwap(line[1]-1,line[2]-1)
    puts "== col #{line[1]}<=>#{line[2]} ===="
  elsif line[0] == 3
    om.inverse()
    puts "== inverse ======"
  elsif line[0] == 4
    om.reverse()
    puts "== reverse ======"
  elsif line[0] == 5
    om.rReverse()
    puts "== row reverse =="
  elsif line[0] == 6
    om.cReverse()
    puts "== col reverse =="
  end
  om.viewMatrix()
end
