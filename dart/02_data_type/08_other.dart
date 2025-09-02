void main(List<String> args) {
  // symbol
  var a = #abc;
  print(a);
  var b = Symbol("abc");
  print(a == b);

  var m = {a: "symbol abc"};
  print(m);

  //dynamic
  dynamic c = 1;
  c = "wohaha";
  print(c);
}
