/* 
  @开头，提供额外信息作为注解提示，可能会有警告，但不影响编译运行
  @override 重写，覆写父类同名方法
  @required 必填，注解命名参数
  @deprecated 弃用，版本过渡不建议使用
 */

class Phone {
  @deprecated
  showTel () {
    showTelNum();
  }

  showTelNum () {
    print("110");
  }
}
void main(List<String> args) {
  var p = Phone();
  // p.showTel(); // 可以使用但是不建议
  p.showTelNum();
}