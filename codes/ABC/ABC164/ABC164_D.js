const main = input => {
    const mod = 2019
    let s = input.trim().split('')
    let ln = s.length
    
    let ms = new Array(ln+1).fill(0)
    let cr = 1
    for(let i = ln-1; 0 <= i; i--) {
      ms[i] = (ms[i+1] + cr*Number(s[i])) % mod
      cr = (cr*10) % mod
    }
    
    let cnt = new Array(mod).fill(0)
    ms.forEach(v => cnt[v] += 1)
    let ans = 0
    cnt.forEach(v => {if(v >= 2) ans += v*(v-1)/2})
    console.log(ans.toString())
  }
  
  main(require("fs").readFileSync("/dev/stdin", "utf8"))