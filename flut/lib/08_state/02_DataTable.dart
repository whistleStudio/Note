import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DataTable"),
        centerTitle: true,
      ),
      body: DataTableDemo(),
    );
  }
}

class User {
  String name;
  int age;
  bool selected;

  User(this.name, this.age, {this.selected=false});
}

class DataTableDemo extends StatefulWidget {
  const DataTableDemo({super.key});

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  List<User> _users = [
    User("zs", 222),
    User("ls", 19),
    User("sddfd", 232, selected: true),
    User("s22fd", 232)
  ];

  List<DataRow> _genUserDataRow () {
    return List.generate(_users.length, (index) => DataRow(
      selected: _users[index].selected,
      onSelectChanged: (select){
        setState(() {
          _users[index].selected = select!;
        });
      },
      cells: [
        DataCell(Text(_users[index].name)),
        DataCell(Text(_users[index].age.toString())),
        DataCell(Text("male")),
        DataCell(Text("---"))
      ]
    ));
  }

  bool _ascending = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: 1,
          sortAscending: _ascending,
          columns: [
            DataColumn(label: Text("姓名")),
            DataColumn(
              label: Text("年龄"), 
              numeric: true,
              onSort: (columnIndex, ascending) {
                setState(() {
                  _ascending = ascending;
                  /* sort逻辑（猜测）：
                    列表元素两两遍历
                    compare返回1, 从小到大, b<a;
                    返回-1, 从大到小, a>b
                   */
                  if (ascending) {
                    _users.sort((a, b) =>  a.age.compareTo(b.age));
                  } else {
                    _users.sort((a, b) =>  b.age.compareTo(a.age));
                  }
                });
                print([columnIndex, ascending]);
              } ,
            ),
            DataColumn(label: Text("性别")),
            DataColumn(label: Text("简介")),
          ],
          rows: _genUserDataRow()
        ),
      ),
    );
  }
}