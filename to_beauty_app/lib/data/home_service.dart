import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/user_models.dart';

import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class HomeService {
  static Future<UserClass?> getUser(
      {required String username, required String email}) async {
    final Uri userURL =
        Uri.parse('${AppStrings.USER_GET}/?username=$username&email=$email');

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("TOKEN: $token");

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(userURL, headers: header);
    print("Status code: ${response.body}");

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final user = UserClass.fromJson(data);
      print("USER: ${user.username}");
      return user;
    } else {
      print('Failed to load get');
      return null;
    }
  }
}
