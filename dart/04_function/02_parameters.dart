void main(List<String> args) {
  // 无return默认返回null, 默认参数dynamic; 有return自动检测
  defaultFunc(p) {
    print(p);
  }

  print(defaultFunc(1));
  print(defaultFunc("sss"));

  // 可选参数，有可能不传参运行时传null，空安全该类型为dynamic或设默认值
  void f1([int p = 0]) {
    print(p);
  }

  f1();

  // 命名可选参数, 同样需要注意空安全
  void f2({String name = "xxx"}) {
    print(name);
  }

  f2();
  f2(name: "abc");

  // 函数参数
  void f3(void a(dynamic)) {}
  f3((d) {});
}
