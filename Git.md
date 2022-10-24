# Git

## 1 安装配置

### 1.1 查看版本 官网下载安装后

```
git --version
```

### 1.2 配置 (config)

~~~
git config --global user.name "xxx"
git config --global user.email "xxx"
git config --list  // 查看
~~~



## 2 创建仓库

### 2.1 初始化 (init/clone)

会在项目中创建隐藏的.git文件

~~~
git init // 项目内初始化

git init [projectName] // 当前目录创建项目并初始化
~~~

或者克隆项目

远程仓库为github时, clone有两种模式https或者ssh

- https - push需要输入用户名 密码
- ssh - push无需输入, 相当于远程仓库与本地电脑建立了密钥

```
git clone [remoteRepoURL] [localRepoName]
```



## 3 基本用法

### 3.1 查看当前项目/工作区的文件状态 (status)

```
 git status
```

### 3.2 添加至版本库的暂存区 (add)

工作区 -> 暂存区

防止文件误传入记录中, 暂进缓存区

```
git add [fileName] // 指定文件
git add . // 添加项目所有文件
```

### 3.3 提交至版本库的核心分支 (commit -m " ")

暂存区 -> master分支

拥有历史节点, 也就是此时版本就可以进行回退, 选择

```
git commit -m "[description]"
```

### 3.4 查询提交记录 (log)

```
git log // 详细

git log --oneline // 只显示提交ID和描述信息第一行

git log --all // 展示所有提交记录, 包括回滚之后的

git log --graph // 图形显示
```

### 3.5 回退记录 (checkout)

```
git checkout [commitNum(hash7位即可)]/[tagName]
```

### 3.6 标记版本 (tag)

```
git tag -a version -m "xxx" // 添加版本号(自动添加作者及时间)及描述信息
git tag // 查看所有版本号
git show [tagName] // 查看指定tag详细信息
git tag -a version -m "xxx" [commitNum(hash7位即可)] // 给历史节点添加tag
```

### 3.7 分支 (branch)

```
git branch [branchName] // 建立分支
git checkout [branchName] // 将HEAD指向指定分支, 往后提交记录将在新的分支上创建
git checkout -b [branchName] // 创建并切换至该分支
git checkout master // 回到核心分支(master产生分支的节点位置)

git merge [branchName] // 将指定的分支合并至当前HEAD所在分支, 产生一个新的节点作为修改后的汇总, 之前的分支保留
git rebase [branchName] // 不产生新的节点将分支在起始处归入master
```



## 4 远程仓库

### 4.1 关联

本地创建仓库连接

```
git remote add [shortName] [remoteRepoURL] // 连接远程仓库, name默认origin
```

从远程仓库克隆至本地的话, 会直接关联远程仓库

### 4.2 查看关联

```
git remote // 查看当前本地仓库连接的 所有 远程仓库
git remote -v // 查看详细信息
```

### 4.3 上传代码

```
git push -u [shortName] [remoteBranchName]
// git push -u origin master
```

### 4.4 删除关联

```
git remote remove [shortName]
```

### 4.5 更改关联

先删除, 再关联

```
git remote remove [shortName] // 删除当前关联
git remote add [shortName] [remoteRepoURL] // 添加新的关联
```

### 4.6 下载代码

```
git clone [remoteRepoURL] [loaclRepoName]
```

### 4.7 解决远程和本地冲突

git pull = git fetch [shortName] master + git merge FETCH_HEAD 

```
git pull // 下拉远程仓库代码
git pull --rebase // 下拉只产生一条master
// 解决冲突
git add .
git commit -m ""
git push -u [shortName] [remoteBranchName] // 重新推送至远程
```



