const main = input => {
    let n = input.split(' ').map(e => parseInt(e))
    
    let flag = 0
    while(n[0] > 0) {
      n[2] -= n[1]
      if(n[2] <= 0) {
        flag = 1
        break
      }
      n[0] -= n[3]
    }
    
    return flag == 1 ? "Yes" : "No"
  }
  
  console.log(main(require("fs").readFileSync("/dev/stdin", "utf8")))