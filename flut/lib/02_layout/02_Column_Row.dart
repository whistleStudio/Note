import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("column_row"),
        centerTitle: true,
      ),
      body: ColumnRowDemo()
    );
  }
}
// width,height受Scaffold框架影响
class ColumnRowDemo extends StatelessWidget {
  const ColumnRowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      color: Colors.amber,
      child: Column(
        // Column 高默认屏幕高度
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.abc, size: 50),
          Icon(Icons.search, size: 50),
          Icon(Icons.alarm, size: 50),
          Icon(Icons.data_array, size: 50),
          Row(
            // Row 宽默认屏幕宽度
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.abc, size: 50),
              Icon(Icons.search, size: 50),
              Icon(Icons.alarm, size: 50),
              Icon(Icons.data_array, size: 50),
            ],
          )
        ],
      )
    );
  }
}
