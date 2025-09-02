import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text("首页"),
        actions: const [Icon(Icons.settings)],
        elevation: 0,
        centerTitle: true,
      ),
      body: HelloFlutter(),
    );
  }
}


// ignore: use_key_in_widget_constructors
class HelloFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
      ),
    );
  }
}