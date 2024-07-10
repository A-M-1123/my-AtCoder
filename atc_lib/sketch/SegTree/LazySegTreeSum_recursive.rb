class LazySegTreeSum
    def initialize(arr)
        @defVal = 0  # sum
        @arrLen = arr.length
        @trBtmLen = calcBottomLength(@arrLen)
        @trLen = @trBtmLen*2 - 1
        @trBtmStID = @trBtmLen-1
        @trBtmEnID = @trBtmStID+@arrLen-1
        @trDepth = calcDepth(@trBtmStID)
        @tree = initTree(arr)
        @lazy = Array.new(@trBtmStID,@defVal)
    end

    def initTree(arr)
        tr = Array.new(@trLen,@defVal)
        i = 0
        while i < @arrLen
            tr[i+@trBtmStID] = arr[i]
            i += 1
        end
        setupTree(tr)
        return tr
    end
    def setupTree(tr)
        return if @trBtmLen < 2
        dep = @trDepth-1
        while 0 <= dep
            i = 0
            stID = calcTopIDByDepth(dep)
            while i < 2**dep
                curID = stID+i
                lid,rid = curID*2+1,curID*2+2
                tr[stID+i] = tr[lid] + tr[rid]  # sum
                i += 1
            end
            dep -= 1
        end
    end

    def evalAll()
        i = 0
        while i < @trBtmStID
            eval(i)
            i += 1
        end
    end
    def eval(id)
        return if @lazy[id] == @defVal
        if id < @trBtmStID
            lid,rid = id*2+1,id*2+2
            if lid < @trBtmStID
                @lazy[lid] += @lazy[id]/2  # sum
                @lazy[rid] += @lazy[id]/2  # sum
            else
                @tree[lid] += @lazy[id]/2  # sum
                @tree[rid] += @lazy[id]/2  # sum
            end
        end
        # puts "[EVAL] id:#{id}(#{calcRangeByID(id).join("~")}) ... #{@tree[id]}->#{@tree[id]+@lazy[id]}"  # sum,debug
        @tree[id] += @lazy[id]  # sum
        @lazy[id] = @defVal
    end

    def query(st,en)
        return calcQuery(0,0,@trBtmLen-1,st,en)
    end
    def calcQuery(curID,rngSt,rngEn,tarSt,tarEn)
        return @defVal if curID >= @trLen || rngEn < tarSt || tarEn < rngSt
        return @tree[curID] if curID >= @trBtmStID
        eval(curID)
        if tarSt <= rngSt && rngEn <= tarEn
            return @tree[curID]
        else
            lid,rid = curID*2+1,curID*2+2
            mid = (rngSt+rngEn)/2
            lVal,rVal = @defVal,@defVal
            lVal = calcQuery(lid,rngSt,mid,tarSt,tarEn) if lid <= @trBtmEnID && !(mid < tarSt || tarEn < rngSt)
            rVal = calcQuery(rid,mid+1,rngEn,tarSt,tarEn) if rid <= @trBtmEnID && !(rngEn < tarSt || tarEn < mid+1)
            return lVal + rVal  # sum
        end
    end

    def update(st,en,val)
        # puts "st.update(#{st},#{en},#{val})"  # debug
        calcUpdate(0,0,@trBtmLen-1,st,en,val)
    end
    def calcUpdate(curID,rngSt,rngEn,tarSt,tarEn,val)
        return if curID > @trBtmEnID || rngEn < tarSt || tarEn < rngSt
        if curID >= @trBtmStID
            @tree[curID] += val
        elsif tarSt <= rngSt && rngEn <= tarEn
            @lazy[curID] += val*(rngEn-rngSt+1)  # sum
            # puts "[UPDATE] tar:#{tarSt}~#{tarEn} / id:#{curID}(#{rngSt}~#{rngEn}) / val:#{val}"  # debug
        elsif curID < @trBtmStID
            lid,rid = curID*2+1,curID*2+2
            mid = (rngSt+rngEn)/2
            calcUpdate(lid,rngSt,mid,tarSt,tarEn,val) if lid <= @trBtmEnID && !(mid < tarSt || tarEn < rngSt)
            calcUpdate(rid,mid+1,rngEn,tarSt,tarEn,val) if rid <= @trBtmEnID && !(rngEn < tarSt || tarEn < mid+1)
            @tree[curID] = @tree[lid] + @tree[rid]  # sum
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
end