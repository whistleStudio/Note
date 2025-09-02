import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridViewNamed"),
        centerTitle: true,
      ),
      body: GridViewNamedDemo(),
    );
  }
}

class GridViewNamedDemo extends StatelessWidget {
  const GridViewNamedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridViewNamedCount(),
        GridViewNamedExtent(),
        GridViewNamedBuilder()
      ],
    );
  }
}

class GridViewNamedCount extends StatelessWidget {
  GridViewNamedCount({super.key});

  final List<Widget> _imgList = List.generate(19, (index) => Image.asset(
    "images/nanjing.jpg"
  ));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: _imgList,
      ),
    ); 
  }
}

class GridViewNamedExtent extends StatelessWidget {
  GridViewNamedExtent({super.key});

  final _imgList = List.generate(19, (index) => Image.asset(
    "images/nanjing.jpg"
  ));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.extent(
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        maxCrossAxisExtent: 100,
        children: _imgList,  
      ),
    );
  }
}

class GridViewNamedBuilder extends StatelessWidget {
  GridViewNamedBuilder({super.key});

  final _imgList = List.generate(19, (index) => Image.asset("images/nanjing.jpg"));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10
        ), 
        itemCount: _imgList.length,
        itemBuilder: (context, index) => _imgList[index],
        // physics: BouncingScrollPhysics(), // 反弹
        // physics: ClampingScrollPhysics(), // 夹住
        // physics: AlwaysScrollableScrollPhysics(),
        physics: NeverScrollableScrollPhysics(), //会实时锁住当前位置

      ),
    );
  }
}


