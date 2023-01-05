import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lifecycle"),
        centerTitle: true,
      ),
      body: LifecycleDemo(),
    );
  }
}

/* StatefulWidget生命周期 */
class LifecycleDemo extends StatefulWidget {
  const LifecycleDemo({super.key});

  // 1 createElement() 创建StatefulElement元素
  @override
  StatefulElement createElement() {
    print("--- createElement ---");
    return super.createElement();
  }

  // 2 createState()
  @override
  State<LifecycleDemo> createState() {
    print("--- createState ---");
    return _LifecycleDemoState();
  }
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  String data = "hello";

  // 3 initState()  
  @override
  void initState() {
    print("--- initState ---");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ShareDataWidget(
      data,
      child: MyWidget()
    );
    // return Text(data);
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

