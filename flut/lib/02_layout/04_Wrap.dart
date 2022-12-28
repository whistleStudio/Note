import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap流式"),
        centerTitle: true,
      ),
      body: WrapDemo(),
    );
  }
}

class WrapDemo extends StatelessWidget {
  WrapDemo({super.key});

  final List<String> _fruits = ["melon", "pear", "apple", "strawberry", "banana"];
  final List<String> _animals = ["cat", "dog", "snake", "elephant", "lion", "tiger"];

  List<Widget> _genList (List<String> l, IconData icon, Color color) {
    return l.map((e) => Chip(
      avatar: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon),
      ),
      label: Text(e),
    )).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Wrap(
          children: _genList(_fruits, Icons.breakfast_dining, Colors.cyan),
          spacing: 10,
          runSpacing: 20,
          alignment: WrapAlignment.spaceEvenly,
          runAlignment: WrapAlignment.center, 
        ),
        Wrap(
          children: _genList(_animals, Icons.cruelty_free, Colors.orange),
          spacing: 10,
        )
      ],
    );
  }
}