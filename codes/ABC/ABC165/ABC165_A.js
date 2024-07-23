const main = input => {
    let lines = input.split('\n')
    let k = Number(lines[0])
    let a = lines[1].split(' ').map(e=>Number(e))
    
    for(let i = a[0]; i <= a[1]; i++) {
      if(i%k == 0) return "OK"
    }
    return "NG"
  }
  
  console.log(main(require("fs").readFileSync("/dev/stdin", "utf8")))