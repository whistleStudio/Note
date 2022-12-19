import './lib/Person.dart';

// class Person {
//   // 默认public
//   String name;
//   // private私有属性或方法名以_开头，且类与main函数为同一作用域时，仍然可以访问；抽离除去后就不能了
//   num _money = 1000;

//   Person(this.name);
// }
void main(List<String> args) {
  var p = Person("xxx");
  print(p);
  // print(p._money);
  var myMoney = p.getMoney();
  print(myMoney);
  // p._saveMoney();
  var nowMoney = p.save();
  print(nowMoney);
}