[toc]

# Typora + Github + 腾讯云, 如何优雅地完成文档编辑与云同步?

> 实现功能: 
>
> - 不同本地间Typora共同写作
> - (文字同步)Github对文字部分进行版本管理
> - (图片同步)腾讯云对象存储搭建图床存放除文字以外的其他静态资源
> - 写完的文章直接全部内容CV大法到CSDN, 简书, 印象笔记这类平台实现线上查看, 避免从本地一张张扒图片再上传

# 1 Typora

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607231908.png" alt="image-20200602211754999" style="zoom: 25%;" />

<a href="https://www.typora.io/">Typora官网下载</a>

众所周知, **typora**作为最为优秀的 **markdown** 写作工具, 简洁的主题界面, 如德芙般丝滑的写作感受, 让每次键盘的敲击都成为一种享受:D 反正我用了typora之后, 平时工作需要的文档也基本全部用它来写了, 非常高效, 同时支持导出的文件格式也很多

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602211437.png" alt="image-20200602211413804" style="zoom: 80%;" />

**实时的效果呈现**也是其他md编辑软件不具备的功能

<video src="https://www.typora.io/img/beta.mp4" style="width: 50%" autoplay>  
</video>



# 2 Github文字同步

> 之所以这里只将文字部分进行同步, 一是国内网速有限, 二是有些文档可能还会有一些体积比较大的文件, 比如像视频资源, git着实不合适; 只管理文字部分体验感就很好, 推拉轻松
>
> *熟悉Git的这部分内容就不用看了, 就是实现用Typora书写的文档版本管理, 其中**忽略除文本以外的资源***

在计算机已安装了**Git**, 并且在 **github已完成注册**前提条件下,

文字同步操作步骤↓↓↓:

## 2.1 创建远程仓库

- 登陆github, 并新建一个远程仓库, 用于存放文档

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602215737.png" alt="image-20200602214955259" style="zoom: 80%;" />

- 给仓库取一个名字, 自然都是Public, 而README, gitignore文件都可以后续再添加, 这里我也全部忽略

  <img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602215759.png" alt="image-20200602215730521" style="zoom: 67%;" />

## 2.2 关联远程仓库

- 接着我们可以通过方法1或者方法2, 在项目目录的命令行中敲入这些代码进行关联. (方法1和方法2 对应的是本地未创建仓库和本地已创建仓库的两种情况)

> 接下来, 我已本地还未创建仓库为例具体介绍一下关联的步骤

### 2.2.1 创建本地仓库

- 在对应的项目目录中打开命令工具, win10可以直接在当前目录shift右击, 选择 **在此处打开Powershell窗口**

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602222049.png" alt="image-20200602222041870" style="zoom:50%;" />

- 输入 `git init`并执行

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602222307.png" alt="image-20200602222251813" style="zoom: 80%;" />

- 此时, 我们就成功新建了一个空的本地仓库. 同时, 在目录下也会新增一个 **隐藏格式的** .git的文件

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602222738.png" alt="image-20200602222720901" style="zoom:67%;" />

- 添加.gitignore文件, 用于过滤掉不用上传的文件, 仍然是在当前目录的命令行工具中, 执行`New-Item .gitignore`

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602224233.png" alt="image-20200602224220797" style="zoom: 80%;" />

- 用记事本打开刚刚创建的.gitignore文件, 写上相应的**过滤规则**(咨询度娘), 我这里希望忽略本地的图片资源, 所以可以写入如下内容并保存

![image-20200602225306805](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602230054.png)

### 2.2.2 关联

- 在目录的命令行工具中执行 `git remote add origin git@github.com:[githubID]/[repositoryName].git`, 关联过程中会要求你输入账号密码, 当然如果已经与本地计算机建立了 **SSH**协议就不用了

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602230058.png" alt="image-20200602230040716" style="zoom: 80%;" />

- 关联成功的话, 我们可以通过`git remote -v`进行查看

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200602230223.png" alt="image-20200602230210972" style="zoom:80%;" />

## 2.3  将本地文件同步到远程

- 在目录的命令行工具中依此执行`git add .` 
- `git commit -m "some description"`
- `git push -u origin master`

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607231942.png" alt="image-20200602231247226" style="zoom:80%;" />

本地上传成功, 远程仓库就有了刚刚上传的文件

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607231947.png" alt="image-20200603224919402" style="zoom: 67%;" />

## 2.4 将远程文件同步到本地

- 当我们使用不同的电脑进行编辑时候, 这时候就需要保持不同电脑本地文件保持统一, 这时候, 首先我们需要做的是在新的电脑上**拷贝远程仓库至本地**, 执行`git clone [remoteRepoURL] [localRepoName]` 

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200603224753.png" alt="image-20200603224738635" style="zoom:80%;" />

拷贝成功, 对应的本地目录

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200603225128.png" alt="image-20200603225112167" style="zoom: 67%;" />

- 后续, 当我们需要在不同的本地进行文档书写时, 每次只需要在对应的目录中执行`git pull`同步最新的远程仓库文件就OK了

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200603231202.png" alt="image-20200603231146033" style="zoom:80%;" />



# 3 腾讯云图片同步

其实, 说是同步, 更准确的是将原本在文档中的本地的图片资源(其他资源以可以), 上传到**静态资源服务器**, 以链接的形式请求; 然而, 除了搭建麻烦, 对于我这样的穷D, 本身买个服务器带宽就不多, 还要占用一定的流量.

所以, 在这里我选择第三方提供给我们搭建好的静态资源服务器, 将文档中的图片上传进去并生成链接, 也就是**图床**的概念, 前面也试过用免费的github搭建图床, 但还是因为网络问题, 效果不佳加载太慢...

> 最终, 我还是投向了鹅厂的怀抱, 利用腾讯云对象存储搭建图床, 操作简单, 速度稳定, 上车免费, 付费价格也挺公道   

图床搭建步骤如下:

## 3.1 创建

-  注册, 登陆腾讯云账号

- 选择产品 - 对象存储
- 创建一个新的存储桶

![image-20200603235510161](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200603235515.png)

- 填写名称, 并更改为"公有读私有写"

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200603235953.png" alt="image-20200603235839663" style="zoom:80%;" />

## 3.2 资源上传以及获取URL

- 点击创建好的存储桶 - 上传文件, 就可以通过拖拽的形式进行上传

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200604000840.png" alt="image-20200604000828074" style="zoom: 50%;" />

- 当我们需要使用其URL时, 点击详情

  <img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200604001120.png" alt="image-20200604001112224" style="zoom:80%;" />

- 将对象地址复制到你需要使用的地方即可

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607232013.png" alt="image-20200604001224713" style="zoom:67%;" />

## 3.3 附: 计费标准

*文章写于2020-06-07, 仅供参考*

- 首次开通会有6个月的免费存储额度

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607214337.png" alt="image-20200607214325460" style="zoom:80%;" />

- 付费参考

  - <a href="https://cloud.tencent.com/document/product/436/40285">计费项</a>
  - <a href="https://cloud.tencent.com/document/product/436/6239">产品定价</a>

  - <a href="https://cloud.tencent.com/document/product/436/6241">计费示例</a>



# 4 搭配图床管理工具效果更佳

按照3.2 的操作, 我们每篇文章这样操作会累使, 这里我们可以借助图床管理工具, 写作的同时就能将图片快速的上传并生成链接, 不用再一张张地拖到腾讯云中

优秀的Typora其本身就支持PicGo这样的图床管理工具

![image-20200604002243262](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200604002246.png)

<a href="https://github.com/Molunerfinn/PicGo">PicGo下载</a>

## 4.1 PicGo图床配置

安装, 打开PicGo

- 选择腾讯云COS, 将COS版本切换成V5; C,D,E参照你在腾讯云对象存储中创建的**存储桶**属性进行填写, F就是上传资源在存储桶中存放的目录位置, 可以不填

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200604003213.png" alt="image-20200604002931034" style="zoom:80%;" />

![image-20200604003450419](G:\Whistle Studio\7.Note\essay\Typora + Github + 腾讯云, 如何优雅地完成文档编辑与云同步.assets\image-20200604003450419.png)

SecretId和SecretKey按照以下方式获取

- 选择密钥管理 - [云API密钥]

![image-20200604003923485](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200604004127.png)

- 在跳转的页面里, 可以按照提示创建子账户或者直接继续使用(我图省事, 直接继续使用了)

![image-20200604004116351](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200604004718.png)

- 第一次使用的话, 我们需要新建一个密钥, 创建成功后, 我们就可以在PicGo里填写SecretId和SecretKey了

![image-20200604004715224](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200604004722.png)

## 4.2 设置Typora上传服务

- 打开Typora后, 选择文件 - 偏好设置 - 图像
- 上传服务 -> **PicGo(app)**
- PicGo路径 -> 你的应用程序安装的路径



![image-20200607205913394](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607215147.png)

- 可以**点击验证图片上传选项**, 若出现验证成功, 则说明上传服务设置成功

![image-20200607210409847](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607215141.png)

## 4.3 使用过程

若在写笔记的过程中, 希望能够多地图片以链接的形式保持同步, 不再需要重新拷贝;

则可以在插入图片后, 右键点击**上传图片**

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607215130.png" alt="image-20200607211147461" style="zoom: 67%;" />

上传成功后, 会看到图片会以新的腾讯云对象存储的URL形式获取

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200607215134.png" alt="image-20200607212709714" style="zoom:67%;" />

这样, 在文档中的图片就将从我们搭建的图床中获取了; 

同时, 现在将写好的文章直接复制粘贴到CSDN, 简书这些平台的时候, 也不用担心图片因为是本地路径丢失的问题了~

---



步骤稍微多了些, 但能多地同步写作和用Typora写博客文章的感受还是 *真香 ~*

