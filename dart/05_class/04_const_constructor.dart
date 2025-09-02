class Point {
  num? x, y;
  Point(this.x, this.y);
}

// 常量构造函数生成的对象指向同一片内存地址，节省资源，执行速度更快
class constPoint {
  // 属性必须都通过final声明
  final num a, b;
  // 常量构造必须通过const声明，不能有函数体{}
  const constPoint(this.a, this.b);
}
void main(List<String> args) {
  Point p1 = Point(1, 2);
  Point p2 = Point(1, 2);
  print(p1 == p2);
  // 常量构造函数 可以 当作普通用，生成的对象仍然不同
  var p3 = constPoint(1, 2);
  var p4 = constPoint(1, 2);
  print(p3 == p4);
  // 生成常量不可变对象，必须通过const关键字
  var p5 = const constPoint(1, 2);
  var p6 = const constPoint(1, 2);
  print(p5 == p6);
}