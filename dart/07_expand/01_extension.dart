// dart sdk >=2.7.0
/* 
extension 用于扩展类（内置外置均可），可以在不改变原类名的基础上，扩充功能；
优点：
1 保持原先类完整性（不在原本基础修改），便于维护，按需添加
2 尽可能小的改动代码结构（新建类继承的话，改动就大了去了）
 */
extension exString on String {
  int parseInt () {
    return int.parse(this);
  }
}

class Cat {
}

extension superCat on Cat {
  void fly () {print("i can fly");}
}
void main(List<String> args) {
  String str = "1111";
  print(str.parseInt());

  Cat c = Cat();
  c.fly();
}