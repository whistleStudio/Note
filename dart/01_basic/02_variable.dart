void main(List<String> args) {
  // 动态类型推断
  var num = 1;
  // num = "aaa"; 错误
  print(num);

  // 多种类型
  dynamic v = 1;
  v = "aaaa";
  print(v);

  // 默认值null
  var defaultV;
  print(defaultV);

  // 常量 const必须初始化且应当于编译阶段确定;
  // final必须声明或构造函数中初始化，值可以运行时确定
  const a = 1;
  print(a);

  final b = DateTime.now();
  print(b);
}
