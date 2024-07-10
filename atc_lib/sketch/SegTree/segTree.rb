class LazySegTreeMax
    def initialize(arr)
        @defVal = -(1.0/0)  # max
        @arrLen = arr.length
        @trBtmLen = calcBottomLength(@arrLen)
        @trLen = @trBtmLen*2 - 1
        @trBtmStID = @trBtmLen-1
        @trDepth = calcDepth(@trBtmStID)
        @tree = initTree(arr)
        @lazy = Array.new(@trLen,@defVal)
        # updateAll()
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

    def eval(id)
        return if @lazy[id] == @defVal
        lid,rid = getChildrenID(id)
        if lid < @arrLen
            @lazy[lid] = [@lazy[lid], @lazy[id]].max    # max
            @lazy[rid] = [@lazy[rid], @lazy[id]].max if rid < @arrLen   # max
        end
        @tree[id] = @lazy[id] if @tree[id] < @lazy[id]  # max
        @lazy[id] = @defVal
    end

    def query(st,en)
        return calcQuery(0,0,@trBtmLen-1,st,en)
    end
    def calcQuery(cur,rngSt,rngEn,tarSt,tarEn)
        return @defVal if cur >= @trLen
        eval(cur)
        if rngEn < tarSt || tarEn < rngSt
            return @defVal
        elsif tarSt <= rngSt && rngEn <= tarEn
            return @tree[cur]
        else
            lid,rid = getChildrenID(cur)
            mid = (rngSt+rngEn)/2
            lVal,rVal = @defVal,@defVal
            lVal = calcQuery(lid,rngSt,mid,tarSt,tarEn) if !(mid < tarSt || tarEn < rngSt)
            rVal = calcQuery(rid,mid+1,rngEn,tarSt,tarEn) if !(rngEn < tarSt || tarEn < mid+1)
            return [lVal,rVal].max  # max
        end
    end

    def update(st,en,val)
        calcUpdate(0,0,@trBtmLen-1,st,en,val)
    end
    def calcUpdate(cur,rngSt,rngEn,tarSt,tarEn,val)
        return if cur >= @trLen
        puts "id<#{cur}>(#{rngSt}~#{rngEn}) / tar...#{tarSt}~#{tarEn} / val...#{val}"
        eval(cur)
        if tarSt <= rngSt && rngEn <= tarEn
            @lazy[cur] = val if @lazy[cur] < val    # max
            eval(cur)
        elsif cur < @trBtmStID
            lid,rid = getChildrenID(cur)
            mid = (rngSt+rngEn)/2
            calcUpdate(lid,rngSt,mid,tarSt,tarEn,val) if !(mid < tarSt || tarEn < rngSt)
            calcUpdate(rid,mid+1,rngEn,tarSt,tarEn,val) if !(rngEn < tarSt || tarEn < mid+1)
            @tree[cur] = [@tree[lid],@tree[rid]].max    # max
        end
    end

    def updateAll()
        return if @trBtmLen < 2
        dep = @trDepth-1
        while dep >= 0
            i = 0
            stID = calcTopIDbyDepth(dep)
            while i < dep**2
                lid,rid = getChildrenID(stID+i)
                @tree[stID+i] = [@tree[lid],@tree[rid]].max  # max
                i += 1
            end
            dep += 1
        end
    end

    def getTree()
        return @tree
    end
    def showTree()
        for i in 0..@trDepth
            st = calcTopIDbyDepth(i)
            puts @tree[st..(st+2**i-1)].join(" ")
        end
    end

    def calcBottomLength(len)
        return 1 if len < 2
        return 2 ** (Math.log2(len-1).to_i + 1)
    end
    def calcTopIDbyDepth(dep)
        return nil if dep < 0
        return 2**dep - 1
    end
    def calcDepth(id)
        return 0 if id < 0
        return Math.log2(id+1).to_i
    end
    def getParentID(cid)
        (cid < 1) ? (return nil):(return ((cid-1)/2).to_i)
    end
    def getChildrenID(pid)
        return [pid*2+1,pid*2+2]
    end
end
