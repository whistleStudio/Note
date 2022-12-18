class Point {
  num x = 0, y = 0;
  // 普通构造函数
  // Point(num a, num b) {
  //   x = a;
  //   y = b;
  // }
  // Point(num x, num y) {
  //   // 避免属性与形参歧义用this
  //   this.x = x;
  //   this.y = y;
  // }
  // 简写形式
  Point(this.x, this.y);
}

void main(List<String> args) {
  var p = Point(1, 2);
  print(p.x);
}
