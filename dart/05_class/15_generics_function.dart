T showMsg<T> (T msg) {
  print(msg);
  return msg;
}
void main(List<String> args) {
  showMsg<String>("ss");
}