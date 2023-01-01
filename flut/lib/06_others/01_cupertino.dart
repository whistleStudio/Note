import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'dart:io';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cupertino"),
        centerTitle: true,
      ),
      body: CupertinoDemo(),
    );
  }
}

class CupertinoDemo extends StatelessWidget {
  const CupertinoDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget dialog;

    // if (Platform.isAndroid) dialog = MaterialDialogDemo();
    // else dialog = CupertinoDialogDemo();

    return SafeArea(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // dialog
          ListTile(title: Text("Material-dialog")),
          MaterialDialogDemo(),
          ListTile(title: Text("IOS-dialog")),
          CupertinoDialogDemo()
        ],
      ),
    );
  }
}

class MaterialDialogDemo extends StatelessWidget {
  const MaterialDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("提示"),
      content: Text("你好吗？"),
      actions: [
        TextButton(onPressed: (){}, child: Text("good")),
        TextButton(onPressed: (){}, child: Text("bad"))
      ],
    );
  }
}

class CupertinoDialogDemo extends StatelessWidget {
  const CupertinoDialogDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("提示"),
      content: Text("你好吗"),
      actions: [
        CupertinoDialogAction(
          child: TextButton(onPressed: (){}, child: Text("good"))
        ),
        CupertinoDialogAction(
          child: TextButton(onPressed: (){}, child: Text("bad")),
        )
      ],
    );
  }
}