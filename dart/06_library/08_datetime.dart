void main(List<String> args) {
  var now = new DateTime.now();
  print(now);
  // 普通构造
  var d = DateTime(2022, 12, 22, 15, 46);
  print(d);
  // 字符串转时间对象
  var d1 = DateTime.parse("2022-12-22 15:48");
  var d2 = DateTime.parse("2022-12-22 15:48:00");
  print(d1);
  print(d2);
  // 时间增量
  print(now.add(Duration(days: 7)));
  // 时间比较
  print(d1.isAfter(d2));
  print(d1.isBefore(d2));
  print(d1.isAtSameMomentAs(d2));
  // 时间差
  var d3 = DateTime(2022, 12, 1);
  var d4 = DateTime(2022, 12, 11);
  var dif = d3.difference(d4);
  print([dif, dif.inDays, dif.inHours]);
  // 时间戳
  print(now.millisecondsSinceEpoch); // 毫秒 13位时间
  print(now.microsecondsSinceEpoch); // 微秒 16位时间
  // 格式化
  String timestamp = "${now.year}-${now.month.toString().padLeft(2, "0")}";
  print(timestamp);
}