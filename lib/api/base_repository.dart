import 'dart:convert';
import 'package:petaverse/api/api_package.dart';

class BaseRepository {
  BaseRepository();
  static List<String> actions = [
    'Delete',
    'Create',
    'Update',
    'GetAll',
    'GetAllById',
    'UpdateList',
    'GetListById',
    'DeleteList'
  ];
  static dynamic readStatusCode(dynamic response) {
    dynamic data = '';
    response.statusCode == 200
        ? data = jsonDecode(response.body)
        : print('Fail' + response.statusCode.toString());
    return data;
  }

  static Future create(dynamic body, String url) async {
    var route = Api.createUrl(url + 'Create');
    final response = await Api.get(route);
    return response;
  }

  static Future delete(List<String> listId, String url) async {
    var route = Api.createUrl(url + 'Delete');
    Map<String, dynamic> id = {"listId": listId};
    var body = jsonEncode(id);
    final response = await Api.delete(body, route);
    return response;
  }

  static Future getAll(String url) async {
    List collection = [];
    var route = Api.createUrl(url + 'GetAll');
    final response = await Api.get(route);
    collection = readStatusCode(response).cast<Map<String, dynamic>>();
    return collection;
  }

  static Future getById(String id, String url) async {
    dynamic item = '';
    var route = Api.createUrl(url + 'GetById');
    final response = await Api.get(route);
    item = readStatusCode(response);
    return item;
  }

  static Future getListById(List<String> listId, String url) async {
    List collection = [];
    var route = Api.createUrl(url + 'GetListById');
    Map<String, dynamic> id = {"listId": listId};
    var body = jsonEncode(id);
    final response = await Api.post(body, route);
    collection = readStatusCode(response).cast<Map<String, dynamic>>();
    return collection;
  }

  static Future update(dynamic body, String url) async {
    var route = Api.createUrl(url + 'Update');
    final response = await Api.update(body, route);
    return response;
  }

  static Future search(dynamic body, String url, String controller) async {
    var route = Api.createUrl(url + controller + '/Search');
    final response = await Api.post(body, route);
    return readStatusCode(response).cast<Map<String, dynamic>>();
  }
}
