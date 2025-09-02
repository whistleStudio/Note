import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter-Swiper"),
        centerTitle: true,
      ),
      body: SwiperDemo(),
    );
  }
}

class SwiperDemo extends StatelessWidget {
  const SwiperDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Swiper1(),
        Swiper2(),
        Swiper3(),
        Swiper4()
      ],
    );
  }
}

class Swiper1 extends StatelessWidget {
  Swiper1({super.key});

  final List<Widget> _imgList = List.generate(3, (index) => Image.asset("images/nanjing.jpg"));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Swiper(
        itemCount: _imgList.length,
        itemBuilder: (context, index) => _imgList[index],
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}

class Swiper2 extends StatelessWidget {
  Swiper2({super.key});

  final List<Widget> _imgList = List.generate(3, (index) => Image.asset("images/nanjing.jpg"));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Swiper(
        itemCount: _imgList.length,
        itemBuilder: (context, index) => _imgList[index],
        viewportFraction: 0.7,
        scale: 0.7,
      ),
    );
  }
}

class Swiper3 extends StatelessWidget {
  Swiper3({super.key});

  final List<Widget> _imgList = List.generate(3, (index) => Image.asset("images/nanjing.jpg"));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Swiper(
        itemCount: _imgList.length,
        itemBuilder: (context, index) => _imgList[index],
        layout: SwiperLayout.STACK, // STACK必须设置itemWidth
        itemWidth: 300,
      ),
    );
  }
}

class Swiper4 extends StatelessWidget {
  Swiper4({super.key});

  final List<Widget> _imgList = List.generate(3, (index) => Image.asset("images/nanjing.jpg"));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Swiper(
        itemCount: _imgList.length,
        itemBuilder: (context, index) => _imgList[index],
        layout: SwiperLayout.TINDER, // TINDER必须设置itemWidth和itemHeight
        itemWidth: 300,
        itemHeight: 200,
      ),
    );
  }
}