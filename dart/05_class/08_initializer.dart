class Rect {
  num? w, h;
  // 默认值必需被{}或[]包裹
  // Rect([this.w=2, this.h]);
  // 初始化列表
  Rect (a) : h = 2, w = 4 {
    print("initial $w");
    w = a;
  }
}

class Point {
  double x, y, z;

  Point(this.x, this.y, this.z);

  // 重定向; 空安全开启后，除var外类型默认非空，需初始化，如在构造函数中进行，不能有遗漏
  // Point.twoD(this.x ,this.y); // 错误写法
  Point.twoD(double x, double y) : this(x, y, 0);
}
void main(List<String> args) {
  var rec = Rect(222);
  print(rec.w);

  var p2 = Point.twoD(1, 2);
  print(p2.z);
  // void len (a=1) {
  //   print(a);
  // }
}