import 'package:flutter/material.dart';
// import '01_basic/01_Home.dart';
import '01_basic/02_Text.dart';
void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

