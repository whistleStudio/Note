import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button"),
        centerTitle: true,
      ),
      body: ButtonDemo(),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          TextButton(
            onPressed: ()=> print("点击TextButton"), 
            onLongPress: () => print("长按TextButton"),
            child: Text(
              "TextButton",
              style: TextStyle(fontSize: 30),
            ),
          ),
          ElevatedButton(
            onPressed: () => print("点击ElevatedButton"),
            onLongPress: () => print("长按ElevatedButton"), 
            child: Text(
              "ElevatedButton",
              style: TextStyle(fontSize: 30)
            )
          ),
          OutlinedButton(
            onPressed: () => print("点击OutlinedButton"),
            onLongPress: () => print("长按OutlinedButton"), 
            child: Text(
              "OutlinedButton",
              style: TextStyle(fontSize: 30)
            )
          )
        ],
      ),
    );
  }
}