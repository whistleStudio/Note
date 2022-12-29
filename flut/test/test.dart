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
  List.generate(2, (index) => null);

  // final Cat c = Cat(name: "ss");
  // Test t = {"name": "ssds"};
}