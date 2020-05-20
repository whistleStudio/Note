# vue-cli

## 1 vue-cli

### 1.1 配置

#### 1.1.1 路径别名

使用时非import的定位需要在前面加 ~

```javascript
//项目根目录创建vue.config.js, 并写入
module.exports = {
  configureWebpack: {
    resolve: {
      alias: {
        "assets": "@/assets",
        "components": "@/components",
      }
    }
  }
}
```

```html
<!-- 使用 -->
<img src="~assets/icon/play.png" alt="play">
```



## 2 vue

### 自定义属性props

即使是静态值, 也需要使用`v-bind: | :`

除了布尔值 `true`时, 可以单写属性

```vue
<!-- props为布尔值.vue -->
<template>
	<div isOk></div>
/* <div :isOk="false"></div> */
</template>

<script>
	export default{
    props: {
      isOk: Boolean
    }
  }
</script>
```



## 3 vue-router

## 4 vuex

配合vue.js.devtools可实现数据追踪, 直接修改state中数据都会发生改变, **mutation, action只是为了方便在工具中追踪**

同步处理数据: 组件methods `commit` -> store mutations 修改state (同步不经过mutations, 工具中则不会有数据变化记录);

异步处理数据: 组件methods `dispatch` -> store actions 异步`commit`  -> store mutations 修改state (异步不经过actions的话, 工具中数据变化会有缺失)

- 同步

```vue
<!-- Sync.vue -->
<template>
	<div>
    <button @click="syncClick">im a btn</button>
  </div>
</template>

<script>
	export default {
    ...
    methods: {
      syncClick(payload='我是默认参数值') {
        this.$store.commit("syncClickM", payload)
      }
    }
  }
</script>
...
```

```javascript
// store/index.js
import Vue from "vue"
import Vuex from "vuex"

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    testNum: 0
  },
  mutations: {
    syncClickM(state, payload) {
      console.log(payload) // 默认pram1传参state, pram2为同步commit过来的值
      state.testNum ++
    }
  }
})

```

- 异步

```vue
<!-- Async.vue -->
<template>
	<div>
    <button @click="asyncClick">im a btn</button>
  </div>
</template>

<script>
	export default {
    ...
    methods: {
      asyncClick(payload='我是默认参数值') {
        this.$store.dispatch("asyncClickA", payload)
      }
    }
  }
</script>
...
```

```javascript
// store/index.js
import Vue from "vue"
import Vuex from "vuex"

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    testNum: 0
  },
  mutations: {
    asyncClickM(state, payload2) {
      console.log(payload2) // 默认pram1传参state, pram2为异步commit过来的值
      state.testNum ++
    }
  },
  actions: {
     asyncClickA(context, payload) {
      console.log(payload) // 默认pram1传参context, pram2为dispatch过来的值
      // context ≈ this.$store
      // 异步处理数据 
      setTimeout(() => {
    		context.commit("asyncClickM", payload2)	    
      }, 3000)
    }
  }
})
```



## 4.1 state

## 4.2 mutations



## 4.3 actions

