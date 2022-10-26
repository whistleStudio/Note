const fs = require("fs")

let data = fs.readFileSync("test.html").toString()
// data = data.replace(/我是/g, "")
// fs.writeFile("test1.html", data, err => {
//   if (!err) {
//     console.log("删除成功")
//   }
// })

// data = data.replace(/(?<=我是)/g, "一个")
// fs.writeFile("test2.html", data, err => {
//   if (!err) {
//     console.log("添加成功")
//   }
// })

// let idx = 0
// let reg = /(?<=>)[\s]*?<li.*?li>/g
// data = data.replace(reg, (match)=>{
//   idx ++
//   if (idx === 2) {
//     return ""
//   } else return match
// })

// fs.writeFile("test2.html", data, err => {
//   if (!err) {
//     console.log("创建成功")
//   }
// })

data = data.replace(/我(?=.*?li>)/g, "你")
fs.writeFile("test4.html", data, err => {
  if (!err) {
    console.log("创建成功")
  }
})