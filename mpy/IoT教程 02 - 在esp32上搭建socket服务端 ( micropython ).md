# IoT教程 02 - esp32上搭建socket服务端 ( micropython )

[toc]

> esp32贼拉好用的主要原因就是本身搭载了wifi 并且支持micropython. 这样, 作为个人玩家基本上只要会一点python后端, 再会一点html,css,js前端三兄弟, 基本就能 **为所欲为**



# 1 关于socket

socket又名套接字, 是抽象的概念, 我的理解就是网络通信的两端, 遵照不同的传输协议, 可以实现客户端与服务端收发数据. 

这里, 也搬运了我学习过程中看过的两篇文章, 帮助大家更好的理解 ↓↓↓

<a href="https://blog.csdn.net/weixin_41047135/article/details/81412176">Socket</a>

<a href="https://blog.csdn.net/user11223344abc/article/details/83780448">Http/TCP/SOCKET</a>

