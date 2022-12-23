/* 
call 使实例化对象可以直接当方法使用
 */

class Cat {
  call () {
    print("my name is aGua");
  }
}
void main(List<String> args) {
  var c = Cat();
  c();
  Cat()();
}