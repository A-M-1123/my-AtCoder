class Grid
    def initialize(h,w,a)
        @h = h; @w = w; @size = h*w
        @a = a
        @gr = Array.new(h*w).map{Array.new(0)}
        @st = @gl = @wl = nil
        @isSt = @isGl = false
        
    end
    def option(*ops)
        while (op = ops.pop)
            case op
            when "1way" then
                @is1Way = true
            when "dir" then
                @isDir = true
            end
        end
    end
    def start(c); @st = c; @isSt = true; end
    def goal(c); @gl = c; @isGl = true; end
    def wall(c); @wl = c; end
    def gen
        dir = ["L","D","R","U"]
        dy = [0,1,0,-1]; dx = [1,0,-1,0]
        y = -1
        while (x = -1) && (y += 1) < @h
            while (x += 1) < @w
                if @a[y][x] == @wl
                    next
                elsif @isSt && @a[y][x] == @st

    end
    
    def to1d(y,x); return y*@h+x; end
end
