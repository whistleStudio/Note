class Person {
  // 默认public
  String name;
  // private私有属性或方法名以_开头
  num _money = 1000;

  Person(this.name);

  num getMoney () {
    return _money;
  }

  num _saveMoney () {
    return _money += 100;
  }

  num save () {
    return _saveMoney();
  }
}