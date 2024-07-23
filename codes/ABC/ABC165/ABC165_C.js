function main(input) {
    let [n, m, q] = input[0].trim().split(" ").map(e => parseInt(e))
    let [a,b,c,d] = [[],[],[],[]]
    for(let i = 0; i < q; i++) {
      [a[i],b[i],c[i],d[i]] = input[i+1].split(' ').map(e=>parseInt(e))
    }
    
    function dfs(arr, num, id) {
      arr.push(num)
      if(id < n-1) {
        let ret = 0
        for(let j = num; j <= m; j++) {
          let rep = dfs(arr.concat(), j, id+1)
          ret = Math.max.apply(null, [ret, rep])
        }
        return ret
      } else {
        let ret = 0
        for(let j = 0; j < q; j++) {
          if(arr[b[j]-1] - arr[a[j]-1] == c[j]) {
            ret += d[j]
          }
        }
        return ret
      }
    }
    
    let ar = []
    let ans = 0
    for(let i = 1; i <= m; i++) {
      let rep = dfs(ar.concat(), i, 0)
      ans = Math.max(ans, rep)
    }
    console.log(ans.toString())
  }
  
  main(require("fs").readFileSync("/dev/stdin", "utf8").trim().split('\n'))