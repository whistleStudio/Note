import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListViewNamed"),
        centerTitle: true,
      ),
      body: ListViewNamedDemo(),
    );
  }
}

class ListViewNamedDemo extends StatelessWidget {
  const ListViewNamedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListViewBuilderDemo(),
        ListViewSeperatedDemo()
      ],
    );
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  ListViewBuilderDemo({super.key});

  final List<Widget> _btns = List.generate(10, (index) => OutlinedButton(
    onPressed: () {},
    child: Text("按钮$index")
  ));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: _btns.length,
        itemExtent: 50,
        itemBuilder: (context, index) {
         return _btns[index]; 
        }
      ),
    );
  }
}

class ListViewSeperatedDemo extends StatelessWidget {
  ListViewSeperatedDemo({super.key});

  final List<Widget> _list = List.generate(10, (index) => ListTile(
    leading: Image.asset("images/nanjing.jpg"),
    title: Text("nj$index"),
    subtitle: Text("xxxx"),
  ));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("列表"),
        ),
        Container(
          height: 250,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return _list[index];
            }, 
            separatorBuilder: (context, index) {
              // 随便啥widget都行
              // return Text("zzz");
              Color divColor = index%2==0 ? Colors.amber : Colors.cyan;
              return Divider(
                color: divColor,
                thickness: 2,
              );
            }, 
            itemCount: _list.length
          ),
        )
      ],
    );
  }
}