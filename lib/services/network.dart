import 'package:http/http.dart';
import 'dart:convert';

class Networking {
  final String url;
  Networking({this.url});

  Future<dynamic> getRequest() async {
    try {
      dynamic response = await get(url);
      if (response.statusCode < 200 && response.statusCode > 99) {
        return 'Processing';
      } else if (response.statusCode < 300) {
        dynamic jsonData = json.decode(response.body);
        return jsonData;
      } else if (response.statusCode < 400) {
        return 'Redirection';
      } else if (response.statusCode < 500) {
        return 'Bad URL';
      } else if (response.statusCode < 600) {
        return 'Server Failed';
      }
    } catch (e) {
      return 'Error : $e';
    }
  }
}
