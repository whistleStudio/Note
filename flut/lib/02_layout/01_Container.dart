import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("container"),
        centerTitle: true,
      ),
      body: ContainerDemo()
    );
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold框架下，child为null时，宽高自动扩充至父元素大小;否则，为child大小
    return Container(
      child: Text(
        "Our Material 3 Design Kit and Material 3 Component libraries have been updated to reflect the new design tokens and their assigned roles. In Figma, Material Theme Builder generates these tokens as Figma",
        style: TextStyle(
          fontSize: 30,
          color: Colors.amber[900]
        ),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      // width: 200,
      // height: 200,
      width: double.infinity,
      height: 500,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.fromLTRB(10.0, 30.0, 0.0, 20.0),
      alignment: Alignment.center, // 会自动height变成infinity
      // transform: Matrix4.translationValues(20.0, 0.0, 0.0),
      // transform: Matrix4.rotationZ(0.1), // 弧度单位
      // transform: Matrix4.skewX(0.2),
      transform:
        Matrix4.translationValues(-10.0, 0.0, 0.0)
        ..rotateZ(0.2),
      decoration: BoxDecoration(
        // border: Border(
        //   top: BorderSide(
        //     width: 1.0,
        //     color: Colors.cyan
        //   )
        // )
        border: Border.all(
          color: Colors.cyan
        ),
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0))
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.lightGreen[50], // gradient会覆盖color
        gradient: LinearGradient(colors: [Colors.amber, Colors.cyanAccent])
      )  
    );
  }
}