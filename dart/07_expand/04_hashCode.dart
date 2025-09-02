class Cat {
  static Cat? _instance;
  Cat();
  factory Cat.single() {
    if (_instance == null) {
      _instance = Cat();
    }
    return _instance!;
  }
}



void main(List<String> args) {
  var cat1 = Cat();
  var cat2 = Cat();
  print("${cat1.hashCode}, ${cat2.hashCode}");
  var cat3 = Cat.single();
  var cat4 = Cat.single();
  print("${cat3.hashCode}, ${cat4.hashCode}");
}