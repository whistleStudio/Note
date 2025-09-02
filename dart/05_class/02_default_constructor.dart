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
  // Point(this.x, this.y);
  // 空安全， 可选参数属性声明要加？或默认值，因为可选, 自动给null或默认值
  Point({this.x=111 , this.y=222});
}

void main(List<String> args) {
  // var p = Point(1, 2);
  var p = Point();
  print(p.x);
  print(p.y);
}
