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
