class Father {

}

class Son<T extends Father> {
  // toString方法可以不写，默认就是这个↓
  // String toString() => "Instance of 'Son<$T>'";
}

class LaoWang {

}

class MyFather extends Father {

}
void main(List<String> args) {
  // var s = Son(); // 默认T 为Father
  // var s = Son<Father>();
  var s = Son<MyFather>();
  // var s = Son<LaoWang>(); //错误
  // 默认调用toString方法
  print(s);
}