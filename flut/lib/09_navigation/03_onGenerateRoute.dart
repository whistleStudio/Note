import 'package:flutter/material.dart';

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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "product");
              }, 
              child: Text("商品页")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, "lalal");
              }, 
              child: Text("lalal")
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/product/1");
              }, 
              child: Text("商品详情页1")
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/product/2");
              }, 
              child: Text("商品详情页2")
            )            
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品页"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()=>Navigator.pop(context), 
          child: Text("返回")
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

class ProductDetail extends StatelessWidget {
  final String detail;
  const ProductDetail({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品详情页"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("当前商品ID: $detail"),
            ElevatedButton(
              onPressed: (){Navigator.pop(context);}, 
              child: Text("返回")
            )
          ],
        ),
      ),
    );
  }
}
