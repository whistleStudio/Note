[toc]

# IoT教程 01 - esp32点亮一盏灯(micopython, vscode)

> 前言:  esp32作为国产开发板的骄傲, 本身搭载了WIFI和蓝牙模块, 非常适合中小型的物联网项目的开发和学习, 某宝售价差不多25元左右. 关于这方面的教程也不是很多, 而用micropython作为开发语言的则更少, 笔者非专业出身, 写一些自学时总结的心得, 也为了让更多业余编程爱好者少走弯路. 如有错误, 欢迎各位大佬指正~

  <a href="https://www.espressif.com/zh-hans/products/socs/esp32/overview">esp32官网链接</a>

# 1 esp32刷入micropython固件  

 ## 1.1 串口驱动安装

 <img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623124135.png" alt="image-20200623124042098" style="zoom: 33%;" />

从某宝买来esp32后, 初次用数据线和计算机进行连接时, 需要先安装相应串口驱动

![image-20200623124626475](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623125650.png)

如无法自动安装, 也可以手动下载安装, 链接如下:

<a href="https://cn.silabs.com/products/development-tools/software/usb-to-uart-bridge-vcp-drivers">CP210x 驱动下载链接</a>

## 1.2 micropython下载

### 1.2.1 关于micropython

micropython可以看作是python针对于电子硬件的版本, 它本身遵循python的语法规则, 在保留了一部分python常用的基本库的基础上又内置了一部分关于操控电子电路的模块库. 借助于python庞大的社群, 可玩性和操作性都可以说是极佳的.

向开发板刷入固件, 就好比我们给计算机安装操作系统, 计算机上的软件要依赖于系统; 我们给开发板编写的程序则要依赖于固件的支持

### 1.2.2 下载固件

登录micropython官网进行下载, 网站打开可能需要一段时间, 在这里我选择了最新的稳定版本下载

<a href="http://www.micropython.org/download/esp32/">micropython官网 - esp32固件下载链接</a>

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623125653.png" alt="image-20200623125638206" style="zoom:50%;" />

## 1.3 固件烧录

### 1.3.1 工具

- 方法一: 可以使用esptool进行固件的烧录, 相关操作以及脚本在micropython官网都有介绍
- 方法二: 使用乐鑫官方的图形化烧录工具

我采用的是方法二,  <a href="https://www.espressif.com/zh-hans/support/download/other-tools">乐鑫官方烧录工具下载链接</a>

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623135015.png" alt="image-20200623135004809" style="zoom: 50%;" />

### 1.3.2 烧录

打开烧录工具

![image-20200623140026319](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623140028.png)

选择开发者模式 - esp32, 载入之前下载好的固件, 我的配置如下(BAUD改成了115200), 具体配置说明可以参考READEME文档

地址必须是 **0x1000**

- 将esp32与计算机连接, 选择相应串口
- 点击ERASE擦除原固件, 显示FINISH成功
- **将需要烧录的固件勾选上**, 点击START烧入固件, 显示FINISH成功
- 烧录完成, 关闭工具即可

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623161424.png" alt="image-20200623161415915" style="zoom:67%;" />



# 2  开发环境配置

## 2.1 VSCode安装RT-Thread MicroPython插件

既然要撸代码, 那我们的第一选择当然是操作丝滑如少女般肌肤的 <a href="https://code.visualstudio.com/">VSCode</a> 进行编辑

要操作开发板的话, 还需要一个串口调试工具,

> 吐槽: 我之前也看视频查资料用了几个但体验感都极差(也可能是我操作不对), 就在我谷歌翻译快崩溃的时候, 我...

打开VSCode插件库搜索micropython, 选择RT-Thread MicroPython进行安装 ( 可以看到这个插件号称是最好用的mpy插件, 关键这句话是中文哎!后续文档资料应该不愁了T T)

![image-20200623151109430](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623151116.png)

### 2.2 创建/打开micropython项目

 ( 我这里已经安装过python插件, 配置了相应环境, 并将终端选择为python解释器)

![image-20200623153545590](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623154305.png)

新建的项目中包含文件如下

​		![image-20200623154247415](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623154340.png)

### 2.3 **使用交互式编程环境** 

当esp2与计算机连接后, 点击连接按钮, 根据提示选择对应串口, 即可完成连接

![image-20200623154530802](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623154542.png)

此时终端会变成`>>>`,  后续的在这里的操作就相当于在烧入了micropython的esp32系统中操作的

![image-20200623160701472](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623171945.png)

我们可以按照python的语法进行编辑, 比如我可已查看esp32里的文件, 并对它进行**增删改查**的操作

![image-20200623160857123](https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623171942.png)



# 3 骚年, 来点灯吧

> 关于esp32的管脚分配, micropython官网文档以及乐鑫的技术文档里都有介绍

## 3.1 点灯程序

```python
from machine import Pin
led = Pin(2, Pin.OUT)
led.on()
```

> 吐槽: 看视频说是有板载灯对应PIN 2, 我程序硬是执行了好几遍, 不见反应, 结果发现我的板子上并没有供测试的板载灯...

## 3.2 在线直接运行

>  笔者从事少儿创客教育的, 所以就拿了公司的led模块做测试(省点是电阻啥的都焊好了), 原理都是一样的, 大家从某宝上购买元器件或类似模块进行调试也行

我在当前项目目录新建了一个led.py文件, 右键点击文件名, 选择第一项`Run the MicroPython File Directly on the Device`,  

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623171257.png" alt="image-20200623171245814" style="zoom: 67%;" />

效果如下:

 <video src="D:\43542\Pictures\EV\20200623_164433.mp4"></video>

## 3.3 下载至esp32离线运行

对于micropython固件, 在设备上电后, 会遵循boot.py -> main.py 执行设备内文件

注意: **其它文件名均不能直接运行,  boot.py在刷固件的时候已经自动创建, 可以通过本教程的2.3查看文件的例子可以看出**

所以, 要是我们想要离线运行文件的还需创建一个 **main.py** 的文件, 本着模块化的思想, 我们可以这样进行书写

```python
# main.py
def main():
    with open('led.py', 'r') as f:
        exec(f.read())
    
if __name__ == '__main__':
    main()
```

- 最后, 将需要离线运行的文件均下载至设备, 右键点击文件选择第二项 `Download the file/floder to the device` ( 我这里就是需要分别将 **led.py** , **main.py** 都下载至设备才行 )

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623171751.png" alt="image-20200623171740179" style="zoom: 67%;" />

此时, 只要外部有进行供电, 程序就可以自动执行 **main.py**, 完成电灯咯~

