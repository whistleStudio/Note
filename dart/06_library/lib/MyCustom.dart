// library 关键词声明会自动添加，且如果未与其他库建立关联时，名字没啥意义，flutter中使用小写_形式
// library my_custom;

class MyCustom {
  String name = "xxxx";
  static var ver = 1;
  int _pwd = 11111; // _私有库内可见

  void showName () {print("my name is $name");}

  get getPwd {return _pwd;}
}