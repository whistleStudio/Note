/* 

 */
class Cat {
  static Cat? _instance; // ? 可空
  Cat._single(); // 命名构造函数语法糖（无参罢了）
  factory Cat.one () {
    if (_instance == null) {
      _instance = Cat._single();
    }
    return _instance!; // ！非空断言
  } 
}
void main(List<String> args) {
  var c1 = Cat.one();
  var c2 = Cat.one();
  print(c1 == c2);
}