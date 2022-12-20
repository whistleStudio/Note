class Person {
  static String name = "static - xxx";
  
  String gender = "male";

  // 实例是类的具体特有化展现，静态属于类，好比共有的属性方法；非静态属于实例，好比其特优化的东西；因此公有当然无法访问到特有，而特有则可以访问到公有
  static printInfo () {
    print("static - $name");
    // print(gender); //错误 静态无法访问非静态
    // showGender (); //错误 静态无法访问非静态
  }

  showGender () {
    print(name);
    print(gender);
    printInfo();
  }
}
void main(List<String> args) {
  print(Person.printInfo());
  Person p = Person();
  p.showGender();
  // print(p.name); // 静态方法属性属于类，实例化对象无法直接调用
  print(Person.name);
}