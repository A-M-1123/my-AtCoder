sx, sy, gx, gy = gets.split.map(&:to_i)

sy *= -1
puts sx - (1.0*(sx-gx)/(sy-gy))*sy