class TwoWayList
    def initialize(size,*args)
        @size = size
        @pre = Array.new(size,-1)
        @nxt = Array.new(size,-1)
        @st = @en = -1
        @length = 0
        @isDefault = true
        setArray(args[0]) if !args[0].nil? && args[0].instance_of?(Array) && !args[0].empty?
    end

    def setArray(arr) # arr[3,0,2,4] -> pre[3,-1,0,-1,2],nxt[2,-1,4,0,-1]
        return if !@isDefault || arr.nil? || arr.min < 0 || @size <= arr.max || arr != arr.uniq
        @isDefault = false
        @st = arr[0]
        i = 0
        while (i += 1) < arr.length
            connect(arr[i-1],arr[i])
        end
        @en = arr[-1]
        @length = arr.length
    end
    
    def insPre(nxtID,insID)
        return makeNode(insID) if @isDefault
        return if isOutOfRange(nxtID) || isOutOfRange(insID) || !isConnect(nxtID)
        delete(insID) if isConnect(insID)
        if nxtID == @st
            @st = insID
        else
            connect(@pre[nxtID],insID)
        end
        connect(insID,nxtID)
        @length += 1
    end
    def insNxt(preID,insID)
        return makeNode(insID) if @isDefault
        return if isOutOfRange(preID) || isOutOfRange(insID) || !isConnect(preID)
        delete(insID) if isConnect(insID)
        if preID == @en
            @en = insID
        else
            connect(insID,@nxt[preID])
        end
        connect(preID,insID)
        @length += 1
    end
    def delete(id)
        return if @isDefault
        if isConnect(id)
            preID,nxtID = @pre[id],@nxt[id]
            if id == @st
                @pre[nxtID] = -1
                @st = nxtID
            elsif id == @en
                @nxt[preID] = -1
                @en = preID
            else
                @nxt[preID],@pre[nxtID] = nxtID,preID
            end
            @pre[id],@nxt[id] = -1,-1
            @length -= 1
        elsif @st == id
            @st = @en = -1
            @pre[id],@nxt[id] = -1,-1
            @isDefault = true
            @length = 0
        end
    end
    def makeNode(id)
        return if !@isDefault || isOutOfRange(id)
        @isDefault = false
        @st = @en = id
        @length = 1
    end

    def getList()
        return [] if @isDefault
        ret = Array.new(@length)
        id = @st
        i = -1
        while (i += 1) < @length
            ret[i] = id
            id = @nxt[id]
        end
        return ret
    end
    def getLength()
        return @length
    end

    def connect(id1,id2)
        @nxt[id1] = id2
        @pre[id2] = id1
    end
    def isOutOfRange(id)
        return (id < 0 || @size <= id)
    end
    def isConnect(id)
        return (0 <= @pre[id] || 0 <= @nxt[id] || id == @st)
    end
end



class TwoWayList
    def initialize(size,*args); @size=size; @pre=Array.new(size,-1); @nxt=Array.new(size,-1); @st=@en=-1; @length=0; @isDefault=true; setArray(args[0]) if !args[0].nil? && args[0].instance_of?(Array) && !args[0].empty?; end
    def setArray(arr); return if !@isDefault || arr.nil? || arr.min < 0 || @size <= arr.max || arr != arr.uniq; @isDefault=false; @st=arr[0]; i=0; while (i += 1) < arr.length; connect(arr[i-1],arr[i]); end; @en=arr[-1]; @length=arr.length; end
    
    def insPre(nxtID,insID); return makeNode(insID) if @isDefault; return if isOutOfRange(nxtID) || isOutOfRange(insID) || !isConnect(nxtID); delete(insID) if isConnect(insID); if nxtID==@st; @st=insID; else; connect(@pre[nxtID],insID); end; connect(insID,nxtID); @length+=1; end
    def insNxt(preID,insID); return makeNode(insID) if @isDefault; return if isOutOfRange(preID) || isOutOfRange(insID) || !isConnect(preID); delete(insID) if isConnect(insID); if preID==@en; @en=insID; else; connect(insID,@nxt[preID]); end; connect(preID,insID); @length+=1; end
    def delete(id); return if @isDefault; if isConnect(id); preID,nxtID=@pre[id],@nxt[id]; if id==@st; @pre[nxtID]=-1; @st=nxtID; elsif id==@en; @nxt[preID]=-1; @en=preID; else; @nxt[preID],@pre[nxtID]=nxtID,preID; end; @pre[id],@nxt[id]=-1,-1; @length-=1; elsif @st==id; @st=@en=-1; @pre[id],@nxt[id]=-1,-1; @isDefault=true; @length=0; end; end
    def makeNode(id); return if !@isDefault||isOutOfRange(id); @isDefault=false; @st=@en=id; @length=1; end
    def getList(); return [] if @isDefault; ret=Array.new(@length); id=@st; i=-1; while (i+=1) < @length; ret[i]=id; id=@nxt[id]; end; return ret; end
    def getLength(); return @length; end

    def connect(id1,id2); @nxt[id1]=id2; @pre[id2]=id1; end
    def isOutOfRange(id); return (id < 0 || @size <= id); end
    def isConnect(id); return (0 <= @pre[id] || 0 <= @nxt[id] || id == @st); end
end
