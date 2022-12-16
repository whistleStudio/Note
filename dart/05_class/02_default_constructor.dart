class Point {
  num x=0, y=0;
  // 普通构造函数
  Point (num x, num y) {
    // 避免属性与形参歧义用this
    this.x = x;
    this.y = y;
  }
}
void main(List<String> args) {
}