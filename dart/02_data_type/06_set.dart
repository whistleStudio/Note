void main(List<String> args) {
  // 集合： 单一元素, 初始化可重复，但会给警告; 无法使用索引获取元素
  // var nums = {1, 2, 3, 3};
  var nums = {1, 2, 3};
  print(nums);

  var nums2 = Set();
  nums2.add("a");
  nums2.add(1);
  print(nums2);

  // 列表去重
  var list = [1, 2, 2, 3];
  print(list.toSet().toList());

  // 集合运算
  var numSet = {1, 2, 3};
  var oddSet = {1, 3, 5};
  // 交集
  print(numSet.intersection(oddSet));
  // 并集
  print(numSet.union(oddSet));
  // 差集
  print(numSet.difference(oddSet));
}
