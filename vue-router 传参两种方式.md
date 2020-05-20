# vue-router 传参两种方式

## 1 params

- 配置路由格式 :

  ```
  /routerPath/:id
  ```

- 传递方式 :

  id匹配运行时路由path对应的值

- 传递后的路径形式 :

  ```
  /routerPath/123
  /routerPath/abc
  ```



## 2 query

- 配置路由格式 :

  ```
  /routerPath
  ```

- 传递方式 :

  利用query传参

  router-link中, v-bind:to="path: '/routerPath ', query: {key1: val1, key2: val2}"

  或

  this.$router.push({path: "/routerPath", query: {key1: val1, key2: val2}})

- 传递后的形式 :

  ```
  /routerPath?key1=val1&key2=val2
  ```

  