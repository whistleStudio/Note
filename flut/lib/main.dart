import 'package:flutter/material.dart';

// import '01_basic/01_Home.dart';
// import '01_basic/02_Text.dart';
import '02_layout/01_Container.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 在移动端任务管理器中的名字
      title: "flutter demo",
      home: Home(),
      // theme: ThemeData(fontFamily: 'AliMama'),
      debugShowCheckedModeBanner: false,
    );
  }
}
