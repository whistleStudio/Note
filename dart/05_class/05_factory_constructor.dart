class Person {
  String name;
  static Person? instance;

  Person.init (this.name);

  // 工厂构造函数不能直接用来实例化对象，且函数体内部不能调用this
  factory Person (name) {
    // 单例模式，第一次构建创建实例，再次构建时仅作复用
    if (instance == null) {
      instance = Person.init(name);
    } 
    return instance!; // ！类型断言，一定非空
  }
}
void main(List<String> args) {
  // 单例模式
  var p = new Person("xx");
  print(p.name);
  print(Person.instance);
  var p2 = new Person("abc");
  print(p2.name);
  print(Person.instance);
}