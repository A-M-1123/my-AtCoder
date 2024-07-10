class SegTreeMin
    def initialize(arr)
        @defVal = (1.0/0)  # min
        @arrLen = arr.length
        @trBtmLen = calcBottomLength(@arrLen)
        @trLen = @trBtmLen*2 - 1
        @trBtmStID = @trBtmLen-1
        @trBtmEnID = @trBtmStID+@arrLen-1
        @trDepth = calcDepth(@trBtmStID)
        @tree = initTree(arr)
        @rngs = initRanges()
        setup(@tree,@rngs)
    end

    def initTree(arr)
        tr = Array.new(@trLen,@defVal)
        i = 0
        while i < @arrLen
            tr[i+@trBtmStID] = arr[i]
            i += 1
        end
        return tr
    end
    def initRanges()
        rng = Array.new(@trLen).map{Array.new(2)}
        i = @trBtmStID
        while i < @trLen
            rng[i][0],rng[i][1] = i-@trBtmStID,i-@trBtmStID
            i += 1
        end
        return rng
    end
    def setup(tr,rg)
        return if @trBtmLen <= 1
        dep = @trDepth-1
        while 0 <= dep
            i = 0
            stID = calcTopIDByDepth(dep)
            while i < 2**dep
                lid,rid = (stID+i)*2+1,(stID+i)*2+2
                (tr[lid] < tr[rid]) ? (tr[stID+i] = tr[lid]):(tr[stID+i] = tr[rid])  # min
                rg[stID+i][0],rg[stID+i][1] = rg[lid][0],rg[rid][1]
                i += 1
            end
            dep -= 1
        end
    end

    def query(st,en)
        
    end

    def update(id,val)
        return if id < 0 || @trBtmEnID < id
        @tree[@trBtmStID+id] = val
        while 0 <= (id = calcParent(@trBtmStID+id))
            lid,rid = id*2+1,id*2+2
            (@tree[lid] < @tree[rid]) ? (newVal = @tree[lid]):(newVal = @tree[rid])  # min
            break if @tree[id] == newVal
            @tree[id] = newVal
        end
    end

    def getTree(); evalAll(); return @tree; end
    def getTreeBottom(); evalAll(); return @tree[@trBtmStID..@trBtmEnID]; end
    
    def showTreeStructure(tr); for i in 0..@trDepth; st=calcTopIDByDepth(i); puts tr[st..(st+2**i-1)].join(" "); end; end
    def showTree(); showTreeStructure(@tree); end
    def showLazy(); showTreeStructure(@lazy); end

    def calcBottomLength(len); return 1 if len<2; return 2**(Math.log2(len-1).to_i + 1); end
    def calcTopIDByDepth(dep); return nil if dep<0; return 2**dep-1; end
    def calcDepth(id); return 0 if id<0; return Math.log2(id+1).to_i; end
    def calcRangeByID(id); return [nil,nil] if id<0 || @trLen<=id; dep = calcDepth(id); topID = calcTopIDByDepth(dep); rngLen = 2**(@trDepth-dep); rngSt = rngLen*(id-topID); return [rngSt,rngSt+rngLen-1]; end
    def calcParent(id); return (id-1)/2; end
end
