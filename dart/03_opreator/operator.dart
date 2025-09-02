import 'dart:ffi';

void main(List<String> args) {
  // 地板除
  print(1 ~/ 2);

  // 类型判断 is, is!
  var a;
  print(a);
  if (a is Int) {
    // 默认空安全
    print("$a is Int");
  }
  if (a is! Int) {
    print("${a.runtimeType.toString()} is not Int");
  }

  // 避空运算符 A??B, A若空才执行B
  // 0也是非空
  // print(0 ?? 3);
  print(null ?? 3);
  var b;
  b ??= 3;
  print(b);
  b ??= 4;
  print(b);

  // ?.避免空对象属性
  var c = {};
  print(c.length);
  var d;
  print(d?.length);

  // 级联运算符，变相实现链式调用
  var e = Set();
  e
    ..add("a")
    ..add("b");
  print(e);
}
