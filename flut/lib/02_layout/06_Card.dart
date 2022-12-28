import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
        centerTitle: true,
      ),
      body: CardDemo()
    );
  }
}

class CardDemo extends StatelessWidget {
  CardDemo({super.key});
  
  final List<Info> info = [
    Info(name: "zhangsan", role: "oxxoxo", tel: 123123123, address: "xxxx"),
    Info(name: "lisi", role: "oxo", tel: 11663123, address: "xsdx"),
  ];

  Card _genCard (Info i) {
    return Card(
      color: Colors.grey[100],
      shadowColor: Colors.grey[600],
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.green[100]!,
          width: 5
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.people, size: 50),
            title: Text(i.name!),
            subtitle: Text(i.role!),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(i.tel.toString(),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(i.address!),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: info.map((e) => _genCard(e)).toList(),
    );
  }
}

class Info {
  String? name;
  String? role;
  int? tel;
  String? address;

  Info({this.name, this.role, this.tel, this.address});
}