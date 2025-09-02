import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio"),
        centerTitle: true,
      ),
      body: DioDemo(),
    );
  }
}

class DioDemo extends StatelessWidget {
  const DioDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: _sendRequest,
          child: Text(
            "send request", 
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }

  void _sendRequest() async {
    var url = "https://httpbin.org/ip";
    try {
      Response response = await Dio().get(url);
      print(response.data['origin']);
    } catch(e){}
  }
}