/* 
1 抽象类，必须通过abstract关键字声明
2 抽象类中也可以写非抽象方法
 */

abstract class Phone {
  // 声明抽象方法, 不用写函数体, ;结尾
  void processor ();
  void camera ();
  
  void info () {
    print("我是抽象类普通方法");
  }
}

class Xiaomi extends Phone {
  // 普通类继承抽象类，必须实现所有抽象方法
  @override
  void processor () {}

  @override 
  void camera () {}
}

void main(List<String> args) {
  // var p1 = Phone();
  var p2 = Xiaomi();
  p2.info();
}