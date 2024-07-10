def getPFSum(a)
    l = a.length
    r = Array.new(l+1,0)
    i = 0
    while i < l
        r[i+1] = r[i] + a[i]
        i += 1
    end
    return r
end
def calcPFSum(a,s,e)
    return a[e+1] - a[s]
end

def getPFSum(a);l=a.length;r=Array.new(l+1,0);i=0;while i < l;r[i+1]=r[i]+a[i];i+=1;end;return r;end; def calcPFSum(a,s,e);return a[e+1]-a[s];end
# getPFSum(array) calcPFSum(array,st,en) 0-index

class PFS
    def initialize(a)
        @len=a.length
        @pfs=Array.new(@len+1,0)
        i=-1
        while(i+=1)<@len
            @pfs[i+1]=@pfs[i]+a[i]
        end
    end
    def calc(l,r)
        l=check(l)
        r=check(r)
        return 0 if l>r
        return @pfs[r+1]-@pfs[l];end
    def check(i);return 0 if i<0;return @len-1 if @len<=i;return i;end
end

class PFS
    def initialize(a); @len=a.length; @pfs=Array.new(@len+1,0); i=-1; while(i+=1)<@len; @pfs[i+1]=@pfs[i]+a[i]; end; end
    def calc(l,r); l=check(l); r=check(r); return 0 if l>r; return @pfs[r+1]-@pfs[l]; end;  def check(i); return 0 if i<0; return @len-1 if @len<=i; return i; end
end


class PFS2d
    def initialize(a,h,w)
        @pfs = Array.new(h+1).map{Array.new(w+1,0)}
        @w = w; @h = h
        y = 0
        while (y += 1) <= @h
            x = 0
            while (x += 1) <= @w
                @pfs[y][x] = a[y-1][x-1] + @pfs[y][x-1] + @pfs[y-1][x] - @pfs[y-1][x-1]
            end
        end
    end
    def calc(y1,x1,y2,x2)
        y1,y2 = checkH(y1),checkH(y2)
        x1,x2 = checkW(x1),checkW(x2)
        return @pfs[y2+1][x2+1] - @pfs[y2+1][x1] - @pfs[y1][x2+1] + @pfs[y1][x1]
    end
    def checkH(y); return 0 if y<0; return @h-1 if @h-1<y; return y; end
    def checkW(x); return 0 if x<0; return @w-1 if @w-1<x; return x; end
end

class PFS2d
    def initialize(a,h,w); @pfs=Array.new(h+1).map{Array.new(w+1,0)}; @w=w; @h=h; y=0; while (y+=1)<=@h; x=0; while (x+=1)<=@w; @pfs[y][x]=a[y-1][x-1]+@pfs[y][x-1]+@pfs[y-1][x]-@pfs[y-1][x-1]; end; end; end
    def calc(y1,x1,y2,x2); y1,y2=checkH(y1),checkH(y2); x1,x2=checkW(x1),checkW(x2); return @pfs[y2+1][x2+1]-@pfs[y2+1][x1]-@pfs[y1][x2+1]+@pfs[y1][x1]; end;  def checkH(y); return 0 if y<0; return @h-1 if @h-1<y; return y; end;  def checkW(x); return 0 if x<0; return @w-1 if @w-1<x; return x; end
end
