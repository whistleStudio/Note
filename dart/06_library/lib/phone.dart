library phone;

// import 'camera.dart'; // import 不存在逐层传递的延续作用
// part相当于分库在主库里又写了一遍，引用主库时，子库内容同样可以使用；并且主库与子库属于同一库，可以访问到私有_属性方法
part 'camera.dart'; 
part './screen.dart';

void showPhone () {
  print("im a phone");
  print("my screen model is ");
}
void main() {
  print("xxx");
  var myS = Screen();
  print(myS._model);
}