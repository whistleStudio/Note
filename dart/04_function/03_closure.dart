// 闭包： 单例变量重复调用，不污染作用域
// 外层函数返回内层函数，内层函数体存在外层函数变量的引用，调用时不销毁

void main(List<String> args) {
  Function out() {
    var n = 1;
    return (int a) {
      n += a;
      print(n);
    };
  }

  var inside = out();
  inside(1);
  inside(2);
  inside(3);
}
