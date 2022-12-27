import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flex"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: FlexDemo(),
    );
  }
}

class FlexDemo extends StatelessWidget {
  const FlexDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              color: Colors.amberAccent,
              height: 50.0,
              width: 50.0,
            ),
            Expanded(
              child: Container(
                color: Colors.cyanAccent,
                height: 50.0,
              ) 
            )
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          textDirection: TextDirection.rtl,
          children: [
            Icon(Icons.abc, size: 50),
            Icon(Icons.search, size: 50),
            Icon(Icons.alarm, size: 50),
            Icon(Icons.data_array, size: 50),            
          ],
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            // Expanded flex默认1
            Expanded(
              child: Container(
                color: Colors.amber,
                width: 100, // width失效
                height: 50,
              ),
            ),
            Expanded(
              // flex: 2,
              child: Container(
                color: Colors.greenAccent,
                height: 50,
              ) 
            )
          ],
        ),
        Container(
          height: 200,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                // Container不设置宽高，尽可能撑到最大，所以宽度是屏幕宽度
                child: Container(
                  color: Colors.amberAccent,
                )
              ),
              // Spacer弹性布局中使用
              Spacer(),
              Expanded(
                child: Container(
                  color: Colors.cyan,
                )
              )
            ],
          ),
        )
      ],
    );
  }
}
