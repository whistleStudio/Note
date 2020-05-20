# npm的使用

## 1 安装

### 1.1 全局安装

```
npm install module -g
```

### 1.2 局部安装(生产依赖)

```
npm install module / npm install module --save / npm install module -S
```

### 1.3 局部安装(开发依赖)

```
npm install module --dev / npm install module -D
```



## 2 卸载

## 2.1 删除全局

```
npm uninstall module -g
```

## 2.2 删除局部

```
npm uninstall module
```



# package.json配置

## 1 依赖安装

- ~  如~1.2.0     安装大于1.2.0 的 1.2.x
- ^ 如^1.2.0     安装大于1.2.0的1.x.x