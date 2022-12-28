enum Test {
  name,
  age
}

class Cat {
  String name;
  int age;
  Cat({required this.name, required this.age});
}

typedef MyType = Map<Test, String>; 
void main() {
  MyType t = {Test.name: "xxx"};
  print(t[Test.name]);

  // final Cat c = Cat(name: "ss");
  // Test t = {"name": "ssds"};
}