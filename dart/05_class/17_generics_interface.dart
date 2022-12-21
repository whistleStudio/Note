abstract class Animal<T> {
  setK (String k, T v);
  getByK (String k);
}

class Cat<T> implements Animal<T> {
  Map info = {};
  @override
  setK(String k, T v) {
    info[k] = v;
  }
  @override
  getByK(String k) {
    print(info[k]);
  }
}


void main(List<String> args) {
  // var agua = Cat(); // T不传，默认dynamic
  var agua = Cat<String>();
  agua.setK("name", "guagua");
  agua.getByK("name");

  var unknown = Cat<int>();
  unknown.setK("1", 2233);
  unknown.getByK("1");

}