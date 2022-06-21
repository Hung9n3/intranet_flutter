import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petaverse/Model/generic_model.dart';
import 'package:petaverse/Model/pet.dart';
import 'package:petaverse/api/base_repository.dart';

class PetRepo {
  static String controller = 'Pet/';
  static Future<List<Pet>> getAll() async {
    var json = await BaseRepository.getAll(controller);
    List<Pet> data = json.map((j) => Pet.fromJson(j)).toList();
    return data;
  }

  static Future<Pet> getById(String id) async {
    var json = await BaseRepository.getById(id, controller);
    Pet data = Pet.fromJson(json);
    return data;
  }

  static Future<List<Pet>> getListById(List<String> listId) async {
    var json = await BaseRepository.getListById(listId, controller);
    List<Pet> data = json.map((j) => Pet.fromJson(j)).toList();
    return data;
  }

  static Future create(Pet pet) async {
    var response =
        await BaseRepository.create(jsonEncode(pet.toJson()), controller);
    return response;
  }

  static Future update(Pet pet) async {
    var response =
        await BaseRepository.update(jsonEncode(pet.toJson()), controller);
    return response;
  }

  static Future delete(List<String> id) async {
    var response = await BaseRepository.delete(id, controller);
    return response;
  }

  static Future<List<Generic>> getPetSuggestion(String query) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List users = json.decode(response.body);

      return users.map((json) => Generic.fromJson(json)).where((user) {
        final nameLower = user.name.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
