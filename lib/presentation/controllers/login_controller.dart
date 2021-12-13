import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/login_user_models.dart';
import 'package:to_beauty_app/presentation/controllers/controller_general.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class LoginController implements ControllerGeral {
  @override
  Uri urlController = Uri.parse(AppConstants.LOGIN_USER);

  @override
  Future<bool> postData(modelClass) async {
    Map data = {
      "username": modelClass.username,
      "password": modelClass.password,
    };

    var prefs = await SharedPreferences.getInstance();
    final http.Response response = await http.post(
      urlController,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      LoginUser.fromJson(mapResponse);
      prefs.setString('token', mapResponse["access"]);
      return true;
    } else {
      throw Exception('Falha ao realizar login');
    }
  }

  @override
  Future<List> getData(id) {
    throw UnimplementedError();
  }

  @override
  Future<List> getAllData() {
    // TODO: implement getAllData
    throw UnimplementedError();
  }
}
