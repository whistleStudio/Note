import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared_Preferences"),
        centerTitle: true,
      ),
      body: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatelessWidget {
  const SharedPreferencesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 递增
          ElevatedButton(
            onPressed: _incrementCounter, 
            child: Text("递增")
          ),
          // 递减
          ElevatedButton(
            onPressed: _decrementCounter, 
            child: Text("递减")
          ),
          // 获取
          ElevatedButton(
            onPressed: _getCounter,
            child: Text("获取")
          ),
          // 字符串
          ElevatedButton(onPressed: _setString, child: Text("设置字符串")),
          ElevatedButton(onPressed: _getString, child: Text("获取字符串")),
          // 清空所有
          ElevatedButton(onPressed: _clear, child: Text("清空"))
        ],
      ),
    );
  }

  void _incrementCounter () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt("counter") ?? 0)+1;
    print("计数：$counter");
    prefs.setInt("counter", counter);
  }

  void _decrementCounter () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt("counter") ?? 0;
    if (counter > 0) counter --;
    print("计数: $counter");
    prefs.setInt("counter", counter);
  }

  void _getCounter () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = prefs.getInt("counter") ?? 0;
    print("计数：$counter");
  }

  void _setString () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("hi", "wtf");
  }

  void _getString () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String hello = prefs.getString("hi") ?? "";
    print("获取字符串: $hello");
  }

  void _clear () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}