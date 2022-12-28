import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack层叠"),
        centerTitle: true,
      ),
      body: StackDemo()
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // 非绝对定位用textDirection，alignment
      textDirection: TextDirection.rtl,
      alignment: Alignment.bottomCenter,
      children: [
        Image(
          fit: BoxFit.cover,
          width: 200,
          height: 200,
          image: NetworkImage("https://img.zcool.cn/community/0125825d385155a80120695c58077c.jpg@1280w_1l_2o_100sh.jpg")
        ),
        Text(
          "AXIBA",
          style: TextStyle(
            fontSize: 25
          ),
        ),
        // 绝对定位
        Positioned(
          top: 20,
          right: 10,
          child: Text(
            "strawberry",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              backgroundColor: Colors.amber
            ),
          )
        )
      ],
    );
  }
}