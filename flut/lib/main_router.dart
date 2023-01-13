import 'package:flutter/material.dart';
import '09_navigation/04_arguments.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 在移动端任务管理器中的名字
      title: "flutter demo",
      // initialRoute: "product", // 被home配置覆盖
      routes: namedRoutes,
      // onGenerateRoute: dynamicRoute, // 03_onGenerateRoute.dart中使用
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UnknownPage()
      ),
      home: Home(), 
      // theme: ThemeData(fontFamily: 'AliMama'),
      debugShowCheckedModeBanner: false,
    );
  }
}

final namedRoutes = {
  "home": (context) => Home(),
  "product": (context) => Product(productName: "命名商品")
};

/* 03_onGenerateRoute.dart中使用 */
// Route dynamicRoute (RouteSettings settings) {
//   if (settings.name == "/") return MaterialPageRoute(builder: (context) => Home());  
//   if (settings.name == "/product") return MaterialPageRoute(builder: (context) => Product());
//   // 处理 "/product/id"
//   final uri = Uri.parse(settings.name??"/");
//   if (uri.pathSegments.length==2 && uri.pathSegments.first=="product") {
//     return MaterialPageRoute(builder: (context) => ProductDetail(detail: uri.pathSegments.last));
//   }
//   return MaterialPageRoute(builder: (context) => UnknownPage());
// }