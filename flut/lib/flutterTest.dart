import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Test"),
        centerTitle: true,
      ),
      body: Test()
    );
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [],
          // children: [
          //   Expanded(
          //     child: Container(
          //       color: Colors.amber
          //     )
          //   ),
          //   Expanded(
          //     child: Container(
          //       color: Colors.cyanAccent
          //     )
          //   )
          // ],
        ),
      ],
    );
  }
}