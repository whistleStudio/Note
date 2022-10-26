[toc]

# JS正则实用技巧（文档编辑向）

假设同级目录下有一段抓取的test.html

```html
<body>
  <div class="header">我是header</div>
  <div>
  	<ul>
      <li style="color: red">我是li0</li>
      <li>我是li1</li>
      <li>我是li2</li>
    </ul>
  </div>
</body>
```

*注:本文案例均在nodejs环境下运行*

关于正则中特殊字符`?`的使用，可以参考这篇文章<a href="https://blog.csdn.net/handsomexiaominge/article/details/87886857?spm=1001.2014.3001.5506">《正则表达式中问号（?）的用法详解》</a>

## 1 查找

- 单个

1) <a href="https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec">RegExp.prototype.exec(str)</a> 

```javascript
<!--找到一个包含“li0”内容的li-->
const fs = require("fs")
let data = fs.readFileSync("test.html").toString()
let reg = /<li.*?li0<\/li>/  //.*?非贪婪匹配任意多个字符（除换行符）  \/转义/
let res = reg.exec(data)
console.log(res[0]) //<li style="color: red">我是li0</li>
```

2) <a href="https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/match">String.prototype.match(reg)</a>

```javascript
<!--找到一个包含"li0"内容的li-->
//读取到data
let reg = /<li.*?li0<\/li>/  //.*?非贪婪匹配任意多个字符（除换行符）  \/转义/
let res = data.match(reg)
console.log(res[0]) //<li style="color: red">我是li0</li>
```

- 全局

1) <a href="https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec">RegExp.prototype.exec(str)</a> 

regexp使用全局标志`g`；

`exec()`每次会从`regexp.lastIndex`位置开始匹配。成功时，属性`lastIndex`会刷新；失败时，`lastIndex`重置为0

```javascript
<!--找到所有包含“我是”的li-->
//读取到data
let reg = /<li.*?我是.*?<\/li>/g  //g全局模式  
let temp, res = []
while ((temp=reg.exec(data)) !== null) {
  res.push(temp[0])
}
console.log(res) //['<li style="color: red">我是li0</li>','<li >我是li1</li>',...]
```

2) <a href="https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/match">String.prototype.match(reg)</a>

regexp使用全局标志`g`

```javascript
<!--找到所有包含“我是”的li-->
//读取到data
let reg = /<li.*?我是.*?<\/li>/g  //g全局模式 
let res = data.match(reg)
console.log(res) //['<li style="color: red">我是li0</li>','<li >我是li1</li>',...]
```



> 增删改操作，配合<a href="https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects/String/replace">String.prototype.replace(regexp|substr, newSubStr|function): newStr</a>

## 2 删除

- 全局

```javascript
<!--删除所有“我是”-->
//读取到data  
data = data.replace(/我是/g, "")
fs.writeFile("test1.html", data, err => {
  if (!err) {
    console.log("创建成功")
  }
})
```

输出文件：

```html
<!--test1.html-->
<body>
  <div class="header">header</div>
  <div>
  	<ul>
      <li style="color: red">li0</li>
      <li >li1</li>
      <li >li2</li>
    </ul>
  </div>
</body>
```

- 局部

一般写出特定的正则匹配删除就行了，这里举个稍许特殊的案例，根据索引删除

```javascript
<!--删除第2个li-->
//读取到data
let idx = 0
let reg = /(?<=>)[\s]*?<li.*?li>/g  //(?<=>)非捕获组匹配>  [\s]*?非贪婪匹配空白字符（含换行）
data = data.replace(reg, (match)=>{
  idx ++
  if (idx === 2) {
    return ""
  } else return match
})
fs.writeFile("test2.html", data, err => {
  if (!err) {
    console.log("创建成功")
  }
})
```

输出文件：

```html
<!--test2.html-->
<body>
  <div class="header">我是header</div>
  <div>
  	<ul>
      <li style="color: red">我是li0</li>
      <li >我是li2</li>
    </ul>
  </div>
</body>
```



## 3 增加

以全局为例，局部和之前的都差不多

```javascript
<!--所有“我是”后面追加“一个”-->
//读取到data
let reg = /(?<=我是)(?=.)/g  //(?<=>)非捕获组匹配我是  (?=.)非捕获组匹配一个字符
data = data.replace(reg, "一个")
fs.writeFile("test3.html", data, err => {
  if (!err) {
    console.log("创建成功")
  }
})  
```

输出文件：

```html
<!--test3.html-->
<body>
  <div class="header">我是一个header</div>
  <div>
  	<ul>
      <li style="color: red">我是一个li0</li>
      <li >我是一个li1</li>
      <li >我是一个li2</li>
    </ul>
  </div>
</body>
```



## 4 替换

以全局为例，局部和之前的都差不多

```javascript
<!--所有li里的“我”改成“你”-->
//读取到data
data = data.replace(/我(?=.*?li>)/g, "你")
fs.writeFile("test4.html", data, err => {
  if (!err) {
    console.log("创建成功")
  }
})
```

输出文件:

```html
<!--test4.html-->
<body>
  <div class="header">我是header</div>
  <div>
  	<ul>
      <li style="color: red">你是li0</li>
      <li >你是li1</li>
      <li >你是li2</li>
    </ul>
  </div>
</body>
```

