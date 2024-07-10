class UnionFind
    # default : 0-index
    def initialize(size,*args)
        (!args.empty? && 0 < args[0]) ? (@idx = 1):(@idx = 0)
        @size = size
        @root = (0..(size-1+@idx)).to_a
        @rank = Array.new(size+@idx, 0)
        @isRoot = Array.new(size+@idx, true)
        @path = []
    end
  
    def unite(id1, id2)
        rt1,rt2 = findRoot(id1),findRoot(id2)
        return if rt1 == rt2
        if @rank[rt1] >= @rank[rt2]
            @root[rt2] = rt1
            @isRoot[id2] = false
            @rank[rt2] += 1 if @rank[rt1] == @rank[rt2]
        else
            @root[rt1] = rt2
            @isRoot[id1] = false
        end
    end

    def isSame(id1, id2)
        return findRoot(id1) == findRoot(id2)
    end

    def getRoot()
        updateAll()
        (@idx == 0) ? (return @root):(return @root[1..@size])
    end
    def getGroup()
        updateAll()
        hs = {}
        i = @idx-1
        while (i += 1) < @size+@idx
            hs[@root[i]] ||= Array.new(0)
            hs[@root[i]].push(i)
        end
        ret = []
        hs.each do |k,v|
            ret.push(v)
        end
        return ret
    end

    def updateAll()
        i = @idx-1
        while (i += 1) < @size+@idx
            findRoot(i) if !@isRoot[@root[i]]
        end
    end
    def findRoot(id)
        while @root[id] != id
            @path.push(id) if !@isRoot[@root[id]]
            id = @root[id]
            @isRoot[id] = false
        end
        while (pt = @path.pop)
            @root[pt] = id
        end
        return id
    end
end



class UnionFind
    # default : 0-index
    def initialize(size,*args); (!args.empty? && 0<args[0])?(@idx=1):(@idx=0); @size=size; @root=(0..(size-1+@idx)).to_a; @rank=Array.new(size+@idx,0); @isRoot=Array.new(size+@idx,true); @path=[]; end  
    def unite(id1, id2); rt1,rt2=findRoot(id1),findRoot(id2); return if rt1==rt2; if @rank[rt1]>=@rank[rt2]; @root[rt2]=rt1; @isRoot[id2]=false; @rank[rt2]+=1 if @rank[rt1]==@rank[rt2]; else; @root[rt1]=rt2; @isRoot[id1]=false; end; end
    def isSame(id1, id2); return findRoot(id1)==findRoot(id2); end
    def getRoot(); updateAll(); (@idx == 0)?(return @root):(return @root[1..@size]); end
    def getGroup(); updateAll(); hs={}; i=@idx-1; while (i += 1)<@size+@idx; hs[@root[i]]||=Array.new(0); hs[@root[i]].push(i); end; ret=[]; hs.each do |k,v|; ret.push(v); end; return ret; end

    def findRoot(id); while @root[id]!=id; @path.push(id) if !@isRoot[@root[id]]; id=@root[id]; @isRoot[id]=false; end; while (pt=@path.pop); @root[pt]=id; end; return id; end
    def updateAll(); i=@idx-1; while (i+=1)<@size+@idx; findRoot(i) if !@isRoot[@root[i]]; end; end
end
