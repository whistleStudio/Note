import 'dart:math';

class Circle {
  final double PI = 3.14;
  num r;

  Circle(this.r);

  // Getter读取器不传参，（）要去掉
  num  get area {
    return PI*pow(r, 2);
  }

  // Setter
  set setR (value) {
    this.r = value;
  }
}
void main(List<String> args) {
  var c = Circle(10);
  print(c.area);
  c.setR = 20;
  print(c.area);
}