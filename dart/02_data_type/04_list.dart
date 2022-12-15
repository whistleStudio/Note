void main(List<String> args) {
  // List声明，元素允许多种类型
  List l1 = [1, 2, "a"];
  print(l1);

  // 泛型类，泛型字面量，限制类型
  List<int> l2 = [1, 2];
  List l3 = <int>[2, 3];
  print(l2);
  print(l3);

  // 通过构造函数, growable默认false
  var l4 = List.empty(growable: true);
  l4.add(1);
  l4.add("a");
  print(l4);
  print(l4.runtimeType);
  var l5 = List.filled(3, 6);
  print(l5);

  // 扩展操作符
  var l6 = [0, ...l5];
  print(l6);

  var l7;
  var l8 = [0, ...?l7];
  print(l8);

  // 列表长度
  print(l1.length);
  // 列表反转 -> Iterable<dynamic> -> List<dynamic>
  print(l1.reversed.toList());
  print(l1.runtimeType);
  // 添加多个元素
  l1.addAll([2, 3, 4, 3]);
  print(l1);
  // 删除元素 （顺序删除第一个）
  l1.remove(3);
  print(l1);
  // 删除对应索引元素
  l1.removeAt(1);
  print(l1);
  // 指定索引添加元素
  l1.insert(1, 9999);
  print(l1);
  // 清空所有元素
  l1.clear();
  print("$l1 is empty? ${l1.isEmpty}");
  // 合并元素
  List l9 = ["today", "is", "thursday"];
  print(l9.join("~"));
}
