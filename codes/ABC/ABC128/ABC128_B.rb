r, d, x = gets.split.map(&:to_i)
def glow(re, de, xi, y)
  if y < 2010
    yx = re * xi - de
    puts yx
    glow(re, de, yx, y + 1)
  end
end
glow(r, d, x, 2000)