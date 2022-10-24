const fs = require("fs")

let data = fs.readFileSync("test.html").toString()
data = data.replace(RegExp(/我是/g), "")
console.log(data)
