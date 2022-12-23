/* 
出现未定义方法错误时，不报红；
实例化对象必须是dynamic类型
 */

class Cat {
  @override
  noSuchMethod(Invocation invocation) {
    print("no such method");
    // return super.noSuchMethod(invocation);
  }
}
void main(List<String> args) {
  print("xx");
  dynamic c = Cat();
  c.say();
}