import 'lib/GrandFather.dart';

/* 
继承
1 子类可以使用父类中 可见的内容
2 可以通过@overrid标记（仅起到标记作用）“覆写”方法
3 可用super关键字引用父类中，可见内容
其中，构造函数需符合父类构造要求，配合初始化列表 利用super
 */

class Father extends GrandFather {
  String name = "fff";
  num money = 1000;

  say () {
    print("father has $money");
  }
  
  Father(this.name);

  Father.run (name) {
    this.name = name;
    print("奔跑的${this.name}");
  } 
}

class Son extends Father {
  // 初始化列表super重定向至父类构造函数
  Son(String name) : super(name); //等价于 语法糖Son(super.name); 调用父级构造传name
  Son.rush(String name) : super.run(name);
  @override
  say () {
    super.say();
    print("son has 2000");
  }
}
void main(List<String> args) {
  var s = Son("sss");
  print(s.money);
  s.say();
  // print(s._money); // 错误 子类无法访问父类私有属性或方法
  s.showGFMoney();
  print(s.grandMoney);
  
  print(s.name);
  s = Son.rush('xxx');
}