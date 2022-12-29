import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image"),
        centerTitle: true,
      ),
      body: ImageDemo()
    );
  }
}

class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "images/nanjing.jpg",
          width: 200,
          height: 200,
        ),
        Image.network(
          "https://img.zcool.cn/community/01bf385c945962a801214168594de3.jpg@1280w_1l_2o_100sh.jpg"
          ,repeat: ImageRepeat.repeatY,
          colorBlendMode: BlendMode.darken,
          color: Colors.amber,
        )
      ],
    );
  }
}