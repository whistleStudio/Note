import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
      ),
      body: ListViewDemo(),
    );
  }
}

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticlListView(),
        horizontalListView()
      ],
    );
  }
}


class verticlListView extends StatelessWidget {
  verticlListView({super.key});

  final List<IconData> _iconList = [Icons.ac_unit, Icons.add_circle, Icons.air, Icons.alarm];
  
  List<Widget> _genIconList (List<IconData> list, int select) {
    return list.map((e) => ListTile(
      leading: Icon(e),
      title: Text(e.toString()),
      subtitle: Text("xxx"),
      selected: list.indexOf(e) == select,
      selectedColor: Colors.pink[200],
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // 多个元素一起可滚动
      child: ListView(
        children: [
          Column(
            children: _genIconList(_iconList, 1),
          ),
          Column(
            children: _genIconList(_iconList, 3),
          ),
        ]
      ),
    );
  }
}

class horizontalListView extends StatelessWidget {
  horizontalListView({super.key});

  final List<Color> _myColors = [
    Colors.amber, Colors.cyan, Colors.pinkAccent, Colors.green
  ]; 

  final Size size = WidgetsBinding.instance.window.physicalSize;

  List<Widget> _genColorContainers(List<Color> c) {
    return c.map((e) => Container(
      color: e,
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // height: 100,
      // 列表需要宽高约束
      child: ListView(
        scrollDirection: Axis.horizontal,
        // Container自适应交叉轴方向最大值
        children: _genColorContainers(_myColors),
        // itemExtent给子元素设置主轴方向大小，因为ListView的元素主轴方向都是无约束，所以不能设置为double.infinity
        itemExtent: size.width,
      ),
    );
  }
}
