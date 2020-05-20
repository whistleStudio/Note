[TOC]

# node.js

## 1 express 创建服务器

```js
const express = require("express")
const app = express()
app.get("/", async (req, res) => {
    await /*异步操作*/
    res.send("processed data")
})
app.listen(port, () => console.log("server start..."))
```



## 2  body-parser

```js
const app = require('express')()
const bodyParser = require('body-parser')
const multer = require('multer') // v1.0.5
const upload = multer() // for parsing multipart/form-data

app.use(bodyParser.json()) // for parsing application/json
app.use(bodyParser.urlencoded({ extended: true })) // for parsing application/x-www-form-urlencoded
```



## 3 mongoose 连接数据库

```js
const mongoose = require("mongoose")
mongoose.connect("mongodb://localhost:27017/database",{
  useCreateIndex: true,
  useFindAndModify: true,
  useNewUrlParser: true
}).then(() => console.log("db study00 connect..."))
```

