def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifSpn)
    nds = Array.new(n+1).map{Array.new(0)}
    i = 0
    while i < m
        id1,id2 = a[i][0],a[i][1]
        w = a[i][2] if ifWgt
        if !ifWgt && !ifLbl
            nds[id1].push(id2)
            nds[id2].push(id1) if !if1way
        else
            ed = [id2]
            ed.push(w) if ifWgt
            ed.push(i+1) if ifLbl
            nds[id1].push(ed)
            if !if1way
                ed = [id1]
                ed.push(w) if ifWgt
                ed.push(i+1) if ifLbl
                nds[id2].push(ed)
            end
        end
        i += 1
    end
    n.times{|i| nds[i+1].push(nil)} if if1way || !ifSpn
    return nds
end


def makeNds(n,m,a,if1way,ifWgt,ifLbl,ifTer);nds=Array.new(n+1).map{Array.new(0)};i=0;while i<m;id1,id2=a[i][0],a[i][1];w=a[i][2]if ifWgt;if !ifWgt && !ifLbl;nds[id1].push(id2);nds[id2].push(id1)if !if1way;else;ed=[id2];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id1].push(ed);if !if1way;ed=[id1];ed.push(w)if ifWgt;ed.push(i+1)if ifLbl;nds[id2].push(ed);end;end;i+=1;end;n.times{|i|nds[i+1].push(nil)}if if1way || !ifTer;return nds;end
# makeNds(ndN,arrL,array,1way?,wgt?,lbl?,spanning?) ex.makeNds(n,m,a,F,F,F,T)
