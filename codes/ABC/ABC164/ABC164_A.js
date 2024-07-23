const main = input => {
    let ln = input.split(' ').map(e => parseInt(e))
    let s = ln[0]
    let w = ln[1];
    
    return s > w ? "safe" : "unsafe"
  }
  
  console.log(main(require("fs").readFileSync("/dev/stdin", "utf8")));