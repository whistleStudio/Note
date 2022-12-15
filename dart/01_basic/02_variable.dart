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

  // 常量 const必须初始化且应当于编译阶段确定; final可以先声明再初始化，且值可以于运行阶段确定
  const a = 1;
  print(a);

  final b;
  b = DateTime.now();
  print(b);
}