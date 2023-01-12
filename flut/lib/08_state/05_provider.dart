import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* 
Provider使用步骤：
1 创建model数据 class MyModel extends ChangeNotifier{}, 注意消息发布notifyListeners()
2 ChangeNotifierProvider注册数据
3 Provider.of<LikesModel>(context)使用数据，注意是否需要监听listen: bool
 */

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LikesModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider"),
          centerTitle: true,
        ),
        body: ProviderDemo(),
      ),
    );
  }
}

class LikesModel extends ChangeNotifier {
  int counter = 0;

  void increment () {
    counter++;
    notifyListeners();
  }
}

class ProviderDemo extends StatelessWidget {
  const ProviderDemo({super.key});

  @override
  Widget build(BuildContext context) {  
    return Column(
      children: [
        Text("${context.watch<LikesModel>().counter}"),
        TextButton(
          // 写在函数里，每次调用会传递新的context，但实际这边provider只要
          onPressed: (){Provider.of<LikesModel>(context, listen:false).increment();}, 
          child: Icon(Icons.thumb_up)
        )
      ],
    );
  }
}