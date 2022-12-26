import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
        centerTitle: true,
      ),
      body: TextDemo()
    );
  }
}
class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "哈喽 Flutter xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 30,
            color: Colors.amber[200],
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.lineThrough,
            decorationColor: Colors.amberAccent
          ),
          textAlign: TextAlign.center,  
          maxLines: 3,   
          overflow: TextOverflow.ellipsis, 
          textScaleFactor: 2,     
        ),
        RichText(
          text: TextSpan(
            text: "sadsadasdas",
            style: TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 223, 232, 22)
            ),
            children: [
              TextSpan(
                text: "GGGGG",
                style: TextStyle(
                  color: Colors.greenAccent
                ),  
              ),
              TextSpan(
                text: "sadasdasd",
                style: TextStyle(color: Colors.cyanAccent)
              )
            ]
          )
        )
      ],
    );
  }
}