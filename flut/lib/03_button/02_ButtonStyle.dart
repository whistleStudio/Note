import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonStyle"),
        centerTitle: true,
      ),
      body: ButtonStyleDemo(),
    );
  }
}

class ButtonStyleDemo extends StatelessWidget {
  const ButtonStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {print("点击");}, 
          child: Text(
            "ElevatedButton"
          ),
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 30
              )
            ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if(states.contains(MaterialState.pressed)) {
                return Colors.amber;
              }
              return Colors.green;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.black;
              }
              return Colors.white;
            }),
            shadowColor: MaterialStatePropertyAll(Colors.amber),
            elevation: MaterialStatePropertyAll(5),
            shape: MaterialStatePropertyAll(
              StadiumBorder(side: BorderSide(
                color: Colors.amber,
                width: 2
              ))
            ),
            minimumSize: MaterialStatePropertyAll(Size(100,100)),
            overlayColor: MaterialStatePropertyAll(Colors.blueAccent)
          ),
        ),
        SizedBox(height: 20),
        OutlinedButtonTheme(
          data: OutlinedButtonThemeData(
            style: ButtonStyle(
              shadowColor: MaterialStatePropertyAll(Colors.lightBlueAccent),
              elevation: MaterialStatePropertyAll(5),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
              minimumSize: MaterialStatePropertyAll(Size(100, 100))
            )
          ), 
          child: Row(
            children: [
              OutlinedButton(onPressed: (){}, child: Text("OB1")),
              OutlinedButton(onPressed: (){}, child: Text("OB2"))
            ],
          ))
      ],
    );
  }
}