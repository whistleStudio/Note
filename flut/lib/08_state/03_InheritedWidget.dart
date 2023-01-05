import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWideget"),
        centerTitle: true,
      ),
      body: InheritedWidgetDemo(),
    );
  }
}

class InheritedWidgetDemo extends StatefulWidget {
  const InheritedWidgetDemo({super.key});

  @override
  State<InheritedWidgetDemo> createState() => _InheritedWidgetDemoState();
}

class _InheritedWidgetDemoState extends State<InheritedWidgetDemo> {
  int _num = 0;

  void _increment () {
    setState(() {
      _num ++;
    });
  }
  void _decrement () {
    setState(() {
      _num --;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ShareDataWidget(
        _num,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _increment, 
              child: Text("+")
            ),
            WidgetA(),
            // Test1(_num), // 没用InheritedWidget写法，通过构造函数逐层传递
            ElevatedButton(
              onPressed: _decrement, 
              child: Text("-")
            )
          ],
        ),
      ),
    );
  }
}

/* 状态管理组件 */
class ShareDataWidget extends InheritedWidget {
  final int num;

  ShareDataWidget(this.num, {super.key, required super.child});

  // 注意context内容，避免上下文不是InheritedWidget所在的上下文，静态方法返回值取null
  static ShareDataWidget? of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify (ShareDataWidget oldWidget) {
    return true;
  }
}

/* A嵌套B，B里使用共享数据 */
class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetB();
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(ShareDataWidget.of(context)!.num.toString()),
    );
  }
}


/* ----------------------------------------- */
/* 没用InheritedWidget写法，通过构造函数逐层传递 */
// class Test1 extends StatelessWidget {
//   final int _num; 
//   Test1(this._num, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Test2(_num),
//     );
//   }
// }
// class Test2 extends StatelessWidget {
//   final int _num; 
//   Test2(this._num, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(_num.toString()),
//     );
//   }
// }

// class Test1 extends StatelessWidget {
//   Test1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Test2(),
//     );
//   }
// }
// class Test2 extends StatelessWidget {
//   Test2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text(ShareDataWidget.of(context)!.num.toString()),
//     );
//   }
// }

// class MyWidget extends StatelessWidget {
//   final num = 1;
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ShareDataWidget(
//       num,
//       child: Test1()
//     );
//   }
// }