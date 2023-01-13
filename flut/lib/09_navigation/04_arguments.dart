import 'package:flutter/material.dart';

/* 
路由传参三种方式
1 匿名路由（实例化过程中）
2 命名路由（通过不同的路径名称，再解析，例程见03_onGenerateRoute）
3 命名路由（路由声明参数arguments，目标页ModalRoute.of(context).settings.arguments）接收
 */
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // 匿名路由传参
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: ((context) => Product(productName: "匿名商品")))
                );
              }, 
              child: Text("匿名商品页")
            ),
            // 命名路由传参
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "product", arguments: {"data": "我是由命名路由传参传过来的"});
              }, 
              child: Text("命名商品页")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "lalal");
              }, 
              child: Text("lalal")
            )
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  // 匿名利用构造函数接收
  final String productName;
  const Product({super.key, required this.productName});

  @override
  Widget build(BuildContext context) {
    // 命名利用ModalRoute.of(context).settings.arguments
    final Map args = (ModalRoute.of(context)!.settings.arguments??const {})as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("$productName页"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("${args['data']}"),
            ElevatedButton(
              onPressed: ()=>Navigator.pop(context), 
              child: Text("返回")
            ),
          ],
        ),
      ),
    );
  }
}

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("not found"),
        centerTitle: true,
      ),
      body: Text("404"),
    );
  }
}