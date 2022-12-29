import 'package:flutter/material.dart';

// import 'flutterTest.dart';
// import '01_basic/01_Home.dart';
// import '01_basic/02_Text.dart';
// import '02_layout/01_Container.dart';
// import '02_layout/02_column_row.dart';
// import '02_layout/03_Flex_Expanded.dart';
// import '02_layout/04_Wrap.dart';
// import '02_layout/05_Stack.dart';
// import '02_layout/06_Card.dart';
// import '03_button/01_Button.dart';
// import '03_button/02_ButtonStyle.dart';
// import '03_button/03_Other_Button.dart';
// import '04_image/01_image.dart';
import '05_list/01_SingleChildScrollView.dart';
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

