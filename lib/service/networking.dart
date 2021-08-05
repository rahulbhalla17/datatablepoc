import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      print(response.statusCode);
    }
  }
}
