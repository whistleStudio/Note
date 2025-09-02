void main(List<String> args) {
  // 声明不需要function关键字

  // 匿名函数 () {}
  List nums = [1, 2, 3];
  nums.forEach((element) {
    print(element);
  });

  // 箭头函数, 函数体只能一行且不带分号
  nums.forEach((element) => print(element));

  // 立即执行函数
  ((e) {
    print(e);
  })(2);
  ((e) => print(e))(1);
}
