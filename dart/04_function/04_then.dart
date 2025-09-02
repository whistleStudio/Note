import 'package:http/http.dart' as http;
import 'dart:convert';

Future getIpAddress() {
  final url = "https://httpbin.org/ip";
  return http.get(Uri.parse(url));
}

void main(List<String> args) {
  getIpAddress()
  .then((res) => print(jsonDecode(res.body)["origin"]))
  .catchError((e) {
    print(e);
  });
}
