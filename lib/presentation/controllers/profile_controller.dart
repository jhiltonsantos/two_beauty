import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/user_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class ProfileController {
  static Future<List<UserData>> getUserData() async {
    final Uri profileUrl = Uri.parse(AppConstants.PROFILE_GET);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(profileUrl, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listUsers = <UserData>[];
      UserData user = UserData.fromJson(map);
      listUsers.add(user);
      return listUsers;
    } else {
      throw Exception('Falha ao carregar usuario');
    }
  }

  static Future<int> getUserId() async {
    final Uri getId = Uri.parse(AppConstants.USER_GET_NAME);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(getId, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      int data = mapResponse["id"];
      return data;
    } else {
      throw Exception('Falha ao carregar usuarios');
    }
  }
}
