import 'dart:io';
import 'package:http/http.dart' as http;

var defaultUrl = 'https://jsonplaceholder.typicode.com/users';
var getAllUrl = 'https://school-management-api.azurewebsites.net/api/';

class Api {
  static Uri createUrl(String controller) {
    var _url = Uri.parse(defaultUrl + controller);
    return _url;
  }

  static Future post(dynamic body, Uri url) async {
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Basic your_api_token_here'
        },
        body: body);
    return response;
  }

  static Future get(Uri url) async {
    final response = await http.get(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      HttpHeaders.authorizationHeader: 'Basic your_api_token_here'
    });
    return response;
  }

  static Future update(dynamic body, Uri url) async {
    final response = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Basic your_api_token_here'
        },
        body: body);
    return response;
  }

  static Future delete(dynamic body, Uri url) async {
    final response = await http.delete(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Basic your_api_token_here'
        },
        body: body);
    return response;
  }
}
