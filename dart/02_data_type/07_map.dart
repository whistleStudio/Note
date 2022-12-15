void main(List<String> args) {
  // 字面量
  var person = {"name": "abao", "age": 2};
  print(person);

  // 构造函数
  var p = Map();
  p["name"] = "awangtou";
  p["age"] = 1111;
  print(p);

  // 判断k, v是否存在
  print(p.containsKey("name"));
  print(p.containsValue("1111"));

  // putIfAbsent 如果k不存在才赋值
  p.putIfAbsent("gender", () => "male");
  print(p);
  p.putIfAbsent("gender", () => "female");
  print(p);

  // 获取keys、values 可迭代对象
  print(p.keys);
  print(p.values);

  // 根据条件删除键值对, true删除
  p.removeWhere((key, value) => key == "gender");
  print(p);
}
