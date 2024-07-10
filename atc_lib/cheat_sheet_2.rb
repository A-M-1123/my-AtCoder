# bit全探索
[0, 1].repeated_permutation(len) do |bin|
  # do
end

# 深さ優先探索(行きがけ)
st = 1
stc = [st]
vis = Array.new(n+1,false); vis[st] = true
while (cur = stc.pop)
  nds[cur].each do |nxt|
    if nxt && !vis[nxt]
      stc << nxt
      vis[nxt] = true
    end
  end
  # do
end
# 深さ優先探索(帰りがけ)
st = 1
stc = [st]
add = Array.new(n+1,false); vis = Array.new(n+1,false)
add[st] = true; len = 1
while 0 < len
  cur = stc[-1]
  isInner = false
  if !vis[cur]
    nds[cur].each do |nxt|
      if nxt && !add[nxt]
        stc << nxt
        len += 1; add[nxt] = true; isInner = true
      end
    end
  end
  (isInner)?(next):(stc.pop; len -= 1)
  # do
end

# 二次元配列 斜め全探索 / sx,sy...startX,startY cx,cy...currentX,currentY
sx = sy = 0; i = -1; cx = cy = 0
while (i = -1) && sx < w && sy < h
  while (i += 1) && 0 <= sx-i && sy+i < h
    cx = sx-i; cy = sy+i
    # do
  end
  (sx < w-1) ? (sx += 1):(sy += 1)
end


