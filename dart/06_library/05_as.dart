// 用as解决命名冲突, common和function库里都有f1
import 'lib/comman.dart';
import 'lib/function.dart' as f;
void main(List<String> args) {
  f1();
  f.f1();
}