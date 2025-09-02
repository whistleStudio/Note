/* 
接口和混入区别：
1 接口是定义需要实现的功能，类似于多个抽象类合用；混入是定义好的功能，实现多个复用的合用
2 接口class implements, 混入mixin(或class不推荐), with
3 接口一般为抽象类，混入必须为基础类（直接继承自Object）
4 混入不能有构造函数
5 因为混入本质是要实现复用，所以使用时存在顺序性，后混覆盖前混
 */
class MixinA {
  String name = "MixinA";

  void printA () {print("AAA");} 
  // MixinA(); // 错误，不能有构造函数
}

mixin MixinB {
  String name = "MixinB";

  void printB () {print("BBB");}
}

class Mx with MixinA, MixinB {

}
void main(List<String> args) {
  Mx mx = Mx();
  // 后混覆盖前混
  print(mx.name);
}