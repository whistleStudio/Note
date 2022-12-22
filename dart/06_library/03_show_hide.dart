// 不存在先后, 有的引就有的用
import 'lib/comman.dart' show f1;
import 'lib/comman.dart' hide f1, f2;
void main(List<String> args) {
  f1();
  f3();
  // f2();
}