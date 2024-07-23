const main = input => {
    let x = Number(input.trim())
    let m = 100
    let y = 0
    while(m < x) {
      y += 1
      m = Math.floor(m * 1.01)
    }
    console.log(String(y))
  }
  
  main(require("fs").readFileSync("/dev/stdin", "utf8"))