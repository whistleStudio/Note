import 'dart:math';

void main(List<String> args) {
  List<int> nums = [4, 5, 6];

  for (var i = 0; i < nums.length; i++) {
    print(nums[i]);
  }

  for (var e in nums) {
    print(e);
  }

  // forEach 仅作遍历
  nums.forEach((e) {
    print(e);
  });

  // map 返回return值组成的新iterable对象
  print(nums.map((e) => pow(e, 2)).toList());

  // where 返回符合条件的元素组成的新iterable
  bool isEven(n) => n % 2 == 0;
  print(nums.where(isEven).toList());

  // any 遍历，返回bool, 是否至少有一个满足条件
  print("any - ${nums.any(isEven)}");

  // every 遍历, 返回bool, 是否全部满足条件
  print("every - ${nums.every(isEven)}");

  // 扩展
  var pairs = [
    [1, 2],
    [33, 44]
  ];
  print(pairs.expand((element) => element).toList());

  // 折叠迭代 inital+e1+e2+e3+...
  print(nums.fold<int>(1, (pre, e) => pre + e));
}
