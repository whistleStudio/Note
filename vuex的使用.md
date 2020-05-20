# vuex的使用

## 1 安装

```
npm install vuex -S //生产依赖
```

## 2 配置文件

为方便管理, 创建./src/store/index.js

index.js配置

```javascript
import Vue from "vue"
import Vuex from "vuex"
// 安装插件
Vue.use(Vuex)
// 建立数据仓库
const store = new Vuex.Store({
  state:{},
  mutations: {},
  actions: {},
  getters: {},
  modules: {}
})

```

