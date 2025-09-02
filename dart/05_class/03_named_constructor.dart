class Point {
  num? x, y ;
  Point(this.x, this.y);
  // 命名构造函数，提高构造的清晰度
  Point.origin () {
    x = 0;
    y = 0;
  }
  Point.fromJson({num x: 2, num y: 3}) {
    this.x = x;
    this.y = y;
  }

}

void main(List<String> args) {
  Point p1 = Point.origin();
  print("${p1.x}, ${p1.y}");
  var p2 = Point.fromJson(x:8);
  print(p2.x);
  print(p2.y);
}
