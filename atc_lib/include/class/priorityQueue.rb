INF=9999999999999
class PQue
    # default : get-Min, isAscend=false : get-Max
    def initialize(*isAscend)
        @arrLen = @len = 0
        (isAscend.empty? || isAscend[0]) ? (@coef=1):(@coef=-1)
        @que = []
    end

    def setArray(arr)
        return if arr.empty?
        @que = Marshal.load(Marshal.dump(arr))
        @arrLen = arr.length; @len = @arrLen
        if @coef < 0
            i = -1
            while (i += 1) < @len
                @que[i] *= -1
            end
        end
        @que.sort!
    end

    def get
        return @que[0]*@coef if 0 < @len
        return nil
    end
    def get2nd
        if @len < 2
            return nil
        elsif @len < 3
            return @que[1]*@coef
        else
            l,r = @que[1],@que[2]
            (l <= r) ? (return l*@coef):(return r*@coef)
        end
    end

    def pop
        return nil if @len < 1
        res = @que[0]
        @que[0] = @que[@len-1]
        @que[@len-1] = -INF
        return res*@coef if (@len -= 1) < 1
        i = 0
        while true
            lid,rid = i*2+1,i*2+2
            break if @len <= lid
            rid = lid if @len <= rid
            if @que[lid] < @que[i] || @que[rid] < @que[i]
                (@que[lid] <= @que[rid]) ? (swp=lid):(swp=rid)
                @que[i],@que[swp] = @que[swp],@que[i]
                i = swp
            else
                break
            end
        end
        return res*@coef
    end

    def push(v)
        if @len == @arrLen
            @que << v*@coef
            @len += 1
            @arrLen += 1
        else
            @que[@len] = v*@coef
            @len += 1
        end
        i = @len-1
        while (pid = getParentID(i))
            if @que[i] < @que[pid]
                @que[i],@que[pid] = @que[pid],@que[i]
                i = pid
            else
                break
            end
        end
    end

    def getQue; return @que; end
    def getLen; return @len; end

    def getParentID(cid); return (cid-1) / 2 if 0 < cid; return nil; end
end
# PQue : setArray(arr) get get2nd pop push(n) getQue getLen



class PQue
    def initialize(*isAscend); @arrLen=@len=0; (isAscend.empty?||isAscend[0])?(@coef=1):(@coef=-1); @que=[]; end
    def setArray(arr); return if arr.empty?; @que=Marshal.load(Marshal.dump(arr)); @arrLen=arr.length; @len=@arrLen; if @coef<0; i=-1; while (i+=1)<@len; @que[i]*=-1; end; end; @que.sort!; end

    def pop; return nil if @len<1; res=@que[0]; @que[0]=@que[@len-1]; @que[@len-1]=-INF; return res*@coef if (@len-=1)<1; i=0; while true; lid,rid=i*2+1,i*2+2; break if @len<=lid; rid=lid if @len<=rid; if @que[lid]<@que[i] || @que[rid]<@que[i]; (@que[lid] <= @que[rid])?(swp=lid):(swp=rid); @que[i],@que[swp]=@que[swp],@que[i]; i=swp; else; break; end; end; return res*@coef; end
    def push(v); if @len==@arrLen; @que << v*@coef; @len+=1; @arrLen+=1; else; @que[@len]=v*@coef; @len+=1; end; i=@len-1; while (pid=getParentID(i)); if @que[i]<@que[pid]; @que[i],@que[pid]=@que[pid],@que[i]; i=pid; else; break; end; end; end
    def get; return @que[0]*@coef if 0<@len; return nil; end
    def get2nd; if @len<2; return nil; elsif @len<3; return @que[1]*@coef; else; l,r=@que[1],@que[2]; (l<=r)?(return l*@coef):(return r*@coef); end; end
    def getQue; return @que; end
    def getLen; return @len; end
    def getParentID(cid); return (cid-1) / 2 if 0 < cid; return nil; end
end
