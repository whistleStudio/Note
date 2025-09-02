import 'package:http/http.dart' as http;
import 'dart:convert';

Future getIpAddress() async {
  final url = "https://httpbin.org/ip";
  return await http.get(Uri.parse(url));
}

void main(List<String> args) {
  (() async {
    try {
      final res = await getIpAddress();
      print(jsonDecode(res.body)["origin"]);
    } catch(e){print(e);};
  })();
}
