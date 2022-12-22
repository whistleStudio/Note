// 引入库也存在main,用as区分
import 'lib/phone.dart' as p;
void main(List<String> args) {
  p.showPhone();
  var c = p.Camera();
  p.takePhoto();
  print(c.brand);

  var s = p.Screen();
  print(s.getM);
  p.main();
}