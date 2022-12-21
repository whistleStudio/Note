/* 
1 接口可以是任意类，但一般用抽象类
2 一个类可以多个接口
 */

abstract class Processor {
  String? cores;
  arch(String name);
}

abstract class Camera {
  String? resolution;
  brand(String name);
}
// 通过普通类实现接口
class Phone implements Processor, Camera {
  // 普通类需要实现所有接口里的属性和方法
  @override
  String? cores;
  String? resolution;

  @override
  arch(String name) {
    print("arch");
  }

  @override
  brand(String name) {
    print("brand");
  }
  
  Phone(this.cores, this.resolution);
}

void main(List<String> args) {
  // Phone p = new Phone("4", resolution)
}