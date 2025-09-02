void main(List<String> args) {
  num a = 2;
  int b = 3; double c = 4;
  print("$a, $b, $c");
  print(a.runtimeType);
  // 类型转化
  print(1.toString());
  print(1.1.toInt()); //向下取整

  // 四舍五入
  print(3.5.round());
  print(3.1415926.toStringAsFixed(3));

  // 比较 0-相同；1-大于；-1-小于
  print(1.compareTo(0));
  // 最大公约数
  print(55.gcd(50));
  // 科学计数法
  print(199999.toStringAsExponential(2));
}