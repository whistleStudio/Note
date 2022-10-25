const fs = require("fs")

let data = fs.readFileSync("test.html").toString()
// data = data.replace(/我是/g, "")
// fs.writeFile("test1.html", data, err => {
//   if (!err) {
//     console.log("删除成功")
//   }
// })

data = data.replace(/(?<=我是)/g, "一个")
fs.writeFile("test2.html", data, err => {
  if (!err) {
    console.log("添加成功")
  }
})