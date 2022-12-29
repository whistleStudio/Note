import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
        centerTitle: true,
      ),
      body: SingeChildScrollViewDemo(),
    );
  }
}

class SingeChildScrollViewDemo extends StatelessWidget {
  const SingeChildScrollViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          // scrollDirection默认vertical
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(10),
          reverse: true,
          child: Row(
            children: List.generate(9, (index) => OutlinedButton(
              onPressed: () {}, 
              child: Text("按钮$index")
            )),
          ),
        ),
        Expanded(
          // SingleChildScrollView主轴需要是有限约束
          child: SingleChildScrollView(
            // 其内部元素变为无限约束
            child: Column(
              children: List.generate(100, (index) => ElevatedButton(
                onPressed: () {},
                child: Text("按钮$index"),
              ))
            ),
          ),
        )
      ],
    );
  }
}