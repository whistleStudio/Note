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
- 点击START烧入固件, 显示FINISH成功
- 烧录完成, 关闭工具即可

<img src="https://whistlestudio-1300400818.cos.ap-nanjing.myqcloud.com/img/20200623142055.png" alt="image-20200623141812612" style="zoom:80%;" />

