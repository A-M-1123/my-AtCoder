def to1d(y,x,w)
    return y*w+x
end
def to2d(n,w)
    return (n / w),(n % w)
end

# to1d(y,x,w) to2d(n,w) <w = width>
def to1d(y,x,w); return y*w+x; end;  def to2d(n,w); return (n / w),(n % w); end
