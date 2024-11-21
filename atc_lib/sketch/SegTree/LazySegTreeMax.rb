class LazySegTreeMax
    def initialize(a)
        @defVal = -10**24    # about-max
        @aLen = a.length
        @trDepth = (@aLen-1).bit_length
        @trBtmLen = 1 << @trDepth
        @trLen = @trBtmLen*2
        @tree = Array.new(@trLen,@defVal)
        @lazy = Array.new(@trBtmLen,@defVal)
        @isFlow = Array.new(@trLen,false)
        initTree(a)
    end
    def initTree(a)
        i = -1
        while (i += 1) < @aLen
            @tree[@trBtmLen+i] = a[i]
        end
        width = @trBtmLen >> 1
        while 0 < width
            cur = width-1
            while (cur+=1) < width*2
                lid,rid = calcChildID(cur)
                @tree[cur] = calc(@tree[lid],@tree[rid])
            end
            width >>= 1
        end
    end

    def query(tarL,tarR)
        return nil if tarL > tarR
        tarL = 0 if tarL < 0
        tarR = @aLen-1 if @aLen <= tarR
        return calcRange(tarL,tarR)
    end

    def calc(v1,v2)
        return (v1>v2)?(v1):(v2)
    end

    def getTree()
        return @tree
    end

    def calcCommonTopBit(a,b)
        a,b = b,a if a > b
        a <<= (b.bit_length - a.bit_length)
        return (a&b) >> ((a^b).bit_length)
    end
    def calcChildID(id)
        return nil,nil if @trBtmLen <= id
        return id << 1,(id << 1)+1
    end
end
