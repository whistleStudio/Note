import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidget"),
        centerTitle: true
      ),
      body: StatefulWidgetDemo(),
    );
  }
}

class StatefulWidgetDemo extends StatefulWidget {
  const StatefulWidgetDemo({super.key});

  @override
  State<StatefulWidgetDemo> createState() => _StatefulWidgetDemoState();
}

class _StatefulWidgetDemoState extends State<StatefulWidgetDemo> {
  int count = 0;

  void _increment () {
    // setState更新页面渲染，否则仅仅是数据
    setState(() {
      count ++;
      print(count);
    });
  }
  
  void _decrement () {
    setState(() {
      count --;
      print(count);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: _increment, child: Text("增加")),
          Text("计数:$count"),
          ElevatedButton(onPressed: _decrement, child: Text("减少"))
        ],
      ),
    );
  }
}