import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView"),
        centerTitle: true,
      ),
      body: GridViewDemo(),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  GridViewDemo({super.key});
  


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridViewCount()
        ),
        Expanded(child: GridViewExtent())
      ],
    );
  }
}

class GridViewCount extends StatelessWidget {
  GridViewCount({super.key});

  static Color _genRandColor () {
    print(Random().nextInt(255));
    return Color.fromRGBO(255, Random().nextInt(255),Random().nextInt(255),1);
  }

  final List<Widget> _gridList = List.generate(9, (index) => Container(
    color: _genRandColor(),
  ));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ),
        // GridView默认childAspectRatio比例为1：1，必传crossAxisCount决定了列数，所以children里元素的宽高就有了数值
        children: _gridList,
      ),
    );
  }
}

class GridViewExtent extends StatelessWidget {
  GridViewExtent({super.key});

  static Color _genRandColor () {
    print(Random().nextInt(255));
    return Color.fromRGBO(Random().nextInt(255), 255, Random().nextInt(255),1);
  }

  final List<Widget> _gridList = List.generate(19, (index) => Container(
    color: _genRandColor(),
  ));

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 100,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10
      ),
      children: _gridList,
    );
  }
}















