import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/src/models/login_user_models.dart';
import 'package:to_beauty_app/src/shared/constants.dart';

class LoginController {
  static Future<bool?> loginUser(
      {required String user, required String password}) async {
    bool value;
    final Uri loginUri = Uri.parse(LOGIN_USER);

    Map data = {
      "username": user,
      "password": password,
    };

    final http.Response response = await http.post(loginUri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data));

    print('Response status: ${response.statusCode}');

    var prefs = await SharedPreferences.getInstance();

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      LoginUser.fromJson(mapResponse);
      //Persistindo o token
      prefs.setString('token', mapResponse["access"]);
      value = true;
    } else {
      print('Falha ao realizar login');
      value = false;
    }
    return value;
  }
}
