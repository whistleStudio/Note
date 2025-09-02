/* 
typedef 自定义类型 （主要用于定义自定义函数的类型）
 */
typedef MathOperation(int a, int b);

// 加法运算
add (int a, int b) {
  print("加法运算：${a+b}");
}
// 减法运算
sub (int a, int b) {
  print("减法运算：${a-b}");
}
// 其他
say () {}

calc (int a, int b, MathOperation op) {
  return op(a, b);
}
void main(List<String> args) {
  // print(add is MathOperation); // dart插件自动判断，没必要
  print(say is MathOperation);
  MathOperation op = add;
  op(2, 3);
  print(calc(5, 89, sub));
}