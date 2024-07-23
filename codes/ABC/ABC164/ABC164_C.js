const main = input => {
    let lns = input.split('\n')
    let s = []
    for(let i = 0; i < lns[0]; i++) {
      s.push(lns[i+1])
    }
    return [...(new Set(s))].length
  }
  
  console.log(main(require("fs").readFileSync("/dev/stdin", "utf8")))