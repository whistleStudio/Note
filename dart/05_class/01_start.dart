// class没法子定义在函数里
class Person {
  // 类的属性，就是类里面顶级作用域里的变量
  var name = "sss";

  // 类的方法，类里面顶级作用域里的函数
  showName () {print(name);}
}

void main(List<String> args) {
  // 实例化
  var p = Person();
  print(p.name);
  p.showName();
}