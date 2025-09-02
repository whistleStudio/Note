import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("drawer测试"),
      ),
      drawer: DrawerDemo(),
      endDrawer: DrawerDemo()
    );
  }
}

class DrawerDemo extends StatelessWidget {
  const DrawerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("www"), 
            accountEmail: Text("ssdfsd@2324.com"),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/nanjing.jpg"),
                fit: BoxFit.cover
              )
            ),
            currentAccountPicture: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage("images/nanjing.jpg"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("设置"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(thickness: 1.2),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text("群组"),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(thickness: 1.2),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("返回"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(thickness: 1.2),
          ListTile(
            horizontalTitleGap: 0,
            leading: Icon(Icons.verified),
            title: AboutListTile(
              child: Text("关于"),
              applicationName: "ilovenanjing",
              applicationVersion: "0.0.0",
              applicationLegalese: "xxxxxx",
              aboutBoxChildren: [Text("1 ssdf"), Text("2 sdfs")],
              applicationIcon: Image.asset("images/nanjing.jpg", width: 50),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pop(context);
            },
          ),          
        ],
      ),
    );
  }
}