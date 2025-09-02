import 'package:flutter/material.dart';

/* statefulWidget生命周期
# StatefulWidget
1 createElement()
2 createState()

# State 
3 initState()
4* didChangeDependencies()
5 build()
6 setState()
7* didUpdateWidget()
8 deactive()
9 dispose()
 */
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  StatefulElement createElement() {
    print("---1 createElement");
    return super.createElement();
  }
  @override
  State<Home> createState(){
    print("---2 createState");
    return _HomeState();
  } 
}

class _HomeState extends State<Home> {
  String data = "hello";

  @override
  void initState() {
    print("---3 initState");
    super.initState();
  }
  // 情况1：initState之后调用，inheritedWidget里的数据发生改变时；
  // 情况2：与之依赖的组件会调用(注意：影响是子组件会调用，非根组件)
  @override
  void didChangeDependencies() {
    print("---4 didChangeDependencies");
    super.didChangeDependencies();
  }
  // 组件配置发生改变，父组件rebuild
  @override
  void didUpdateWidget(covariant Home oldWidget) {
    print("---7 didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  // 页面切换
  @override
  void deactivate() {
    print("---8 deactive");
    super.deactivate();
  }
  // app关闭
  @override
  void dispose() {
    print("---9 dispose");
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("---5 build");
    return ShareDataWidget(
      data,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Lifecycle"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            MyWidget(),
            My2()
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: (){
            setState(() {
              print("---6 setState");
              data += "o";
            });
          }, 
          child: Icon(Icons.change_circle)
        ),
      ),
    );
  }
}


/* StatelessWidget生命周期 —— 主要就两createElement()和build() */
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!._data);
  }
}

class ShareDataWidget extends InheritedWidget {
  final String _data;

  ShareDataWidget(this._data, {super.key, required super.child});

  static ShareDataWidget? of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  @override
  bool updateShouldNotify (ShareDataWidget oldWidget) {
    return true;
  }
}


/* 验证didUpdateWidget, 父组件调用setState,子组件就会调用didUpdateWidget；
   验证didChangeDependencies, inheritedWidget数据改变，依赖该数据的组件调用
 */
class My2 extends StatefulWidget {
  const My2({super.key});

  @override
  State<My2> createState() => _My2State();
}

class _My2State extends State<My2> {
  @override
  void didUpdateWidget(covariant My2 oldWidget) {
    print("didUpdateWidget My2");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void didChangeDependencies() {
    print("didChangeDependcies My2");
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Text(ShareDataWidget.of(context)!._data);
  }
}
