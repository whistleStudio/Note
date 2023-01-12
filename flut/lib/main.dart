import 'package:flutter/material.dart';

// import 'flutterTest.dart';
// import '01_basic/01_Home.dart';
// import '01_basic/02_Text.dart';
// import '02_layout/01_Container.dart';
// import '02_layout/02_column_row.dart';
// import '02_layout/03_Flex_Expanded.dart';
// import '02_layout/04_Wrap.dart';
// import '02_layout/05_Stack.dart';
// import '02_layout/06_Card.dart';
// import '03_button/01_Button.dart';
// import '03_button/02_ButtonStyle.dart';
// import '03_button/03_Other_Button.dart';
// import '04_image/01_image.dart';
// import '05_list/01_SingleChildScrollView.dart';
// import '05_list/02_ListView.dart';
// import '05_list/02_ListViewNamed.dart';
// import '05_list/03_GridView.dart';
// import '05_list/04_GridViewNamed.dart';
// import '06_others/01_cupertino.dart';
// import '07_third_party/01.dio.dart';
// import '07_third_party/02_flutter_swiper.dart';
// import '07_third_party/03_shared_preference.dart';
// import '08_state/01_StatefulWidget.dart';
// import '08_state/02_DataTable.dart';
// import '08_state/03_InheritedWidget.dart';
// import '08_state/04_lifecycle.dart';
// import '08_state/05_provider.dart';
// import '09_navigation/01_anoymous.dart';
// import '09_navigation/02_namedRouter.dart';
// import '09_navigation/03_onGenerateRoute.dart';
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
  "product": (context) => Product()
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