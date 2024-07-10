def dijkstra(n,nds,st)
  pq = PQueVector.new(2,1)
  dist = Array.new(n+1,INF)
  pq.push([st,0])
  while (i,d = pq.pop)
    if dist[i] == INF
      dist[i] = d
      nds[i].each do |nxt|
        pq.push([nxt[0],d+nxt[1]]) if nxt && dist[nxt[0]] == INF
      end
    end
  end
  return dist
end

# dijkstra(nodeN,nds,startID)
def dijkstra(n,nds,st); pq=PQueVector.new(2,1); dist=Array.new(n+1,INF); pq.push([st,0]); while (i,d=pq.pop); if dist[i]==INF; dist[i]=d; nds[i].each do |nxt|; pq.push([nxt[0],d+nxt[1]]) if nxt&&dist[nxt[0]]==INF; end; end; end; return dist; end
