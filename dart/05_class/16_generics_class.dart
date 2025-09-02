class GenericsClass<T> {
  late T msg;
  Set s = Set<T>();
  GenericsClass (T msg) {
    this.msg = msg;
    s.add(msg); 
  }

  addMsg (T addMsg) {
    s.add(addMsg);
  }
}
void main(List<String> args) {
  var gc = GenericsClass<String>("a");
  print(gc.s);
  // gc.addMsg(1);
  gc.addMsg("b");
  print(gc.s);

  // 字面量形式泛型
  // List l = [1]; // 错误， 这样写l仍然不是List<int>类型
  List l = <int>[];
  // l.add(1);
  l.addAll(<int>[1,2,3]);
  print(l);
}