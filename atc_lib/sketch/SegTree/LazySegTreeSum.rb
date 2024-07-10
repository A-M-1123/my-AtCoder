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
                tr[stID+i] = tr[lid] + tr[rid]  # sum
                rg[stID+i][0],rg[stID+i][1] = rg[lid][0],rg[rid][1]
                i += 1
            end
            dep -= 1
        end
    end

    def evalAll()
        i = 0
        while i < @trBtmStID
            eval(i) if @lazy[i] != @defVal
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

    def query_old(st,en)
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
    def queryPoint(id)
        return @tree[@trBtmStID+id]
    end

    def query(tarL,tarR)
        return if tarR < tarL
        tarL = 0 if tarL < 0
        tarR = @arrLen-1 if @arrLen <= tarR
        return @tree[0] if tarL == 0 && tarR == @arrLen-1
        ret = @defVal
        que = [0]
        len = 1
        i = 0
        while i < len
            id = que[i]
            rngL,rngR = @rngs[id]
            eval(id) if @lazy[id] != @defVal
            if (tarL <= rngL && rngR <= tarR) || @trBtmStID <= id
                ret += @tree[id]  # sum
            else
                lid,rid = id*2+1,id*2+2
                mid = (rngL+rngR+1)/2
                if !(tarR < rngL || mid-1 < tarL)
                    if lid < @trBtmStID
                        que.push(lid)
                        len += 1
                    else
                        ret += @tree[lid]  # sum
                    end
                end
                if !(tarR < mid || rngR < tarL)
                    if rid < @trBtmStID
                        que.push(rid)
                        len += 1
                    else
                        ret += @tree[rid]  # sum
                    end
                end
            end
            i += 1
        end
        return ret
    end

    def update(tarL,tarR,val)
        return if tarR < tarL
        tarL = 0 if tarL < 0
        tarR = @arrLen-1 if @arrLen <= tarR
        que = [[0,false]]
        len = 1
        i = 0
        while i < len
            id,isLeaf = que[i]
            rngL,rngR = @rngs[id]
            eval(id) if id < @trBtmStID && @lazy[id] != @defVal
            if @trBtmStID <= id
                @tree[id] += val  # sum  
                que[i][1] = true
            elsif tarL <= rngL && rngR <= tarR
                @lazy[id] += val*(rngR-rngL+1)  # sum
                que[i][1] = true
            else
                lid,rid = id*2+1,id*2+2
                mid = (rngL+rngR+1)/2
                if !(tarR < rngL || mid-1 < tarL)
                    if lid < @trBtmStID
                        que.push([lid,false])
                        len += 1
                    else
                        @tree[lid] += val  # sum
                    end
                end
                if !(tarR < mid || rngR < tarL)
                    if rid < @trBtmStID
                        que.push([rid,false])
                        len += 1
                    else
                        @tree[rid] += val  # sum
                    end
                end
            end
            i += 1
        end
        i -= 1
        while 0 <= i
            while 0 <= i && que[i][1]
                i -= 1
            end
            break if i < 0
            id = que[i][0]
            @tree[id] = @tree[id*2+1]+@tree[id*2+2]  # sum
            i -= 1
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
