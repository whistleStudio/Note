// deffered懒加载, 有了改deferred，引入库会多一个loadLibrary的异步方法
import 'lib/function.dart' deferred as f;
void main(List<String> args) {
  print(1);
  load();
  print(2);
  print(3);
}

Future load () async {
  await f.loadLibrary();
  f.f1();
}