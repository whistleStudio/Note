import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Other Buttons"),
        centerTitle: true,
      ),
      body: OtherButtonsDemo(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        elevation: 0,
      )
    );
  }
}

class OtherButtonsDemo extends StatelessWidget {
  const OtherButtonsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        // 图标按钮
        IconButton(
          icon: Icon(Icons.add_alarm),
          onPressed: () {},
          color: Colors.amber,
          splashColor: Colors.cyan,
          highlightColor: Colors.pink,
          tooltip: "hint",
        ),
        // icon命名构造函数
        OutlinedButton.icon(onPressed: (){}, icon: Icon(Icons.pedal_bike), label: Text("xxx")),
        ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.bus_alert), label: Text("")),
        // 按钮组，超出显示范围时，自动改变排列方向
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add_circle), label: Text("按钮一")),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add_circle), label: Text("按钮二")),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add_circle), label: Text("按钮三")),
            // ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add_circle), label: Text("按钮三")),
          ],
        ),
        BackButton(),
        CloseButton()
      ]
    );
  }
}