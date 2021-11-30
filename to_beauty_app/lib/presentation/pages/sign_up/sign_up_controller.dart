import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/domain/user_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class ApiController {
  final Uri apiUri = Uri.parse(AppStrings.API_URL);
  final Uri apiCreate = Uri.parse(AppStrings.USER_CREATE);

  Future<bool> createUser(UserClass user) async {
    Map data = {
      'username': user.username,
      'email': user.email,
      'first_name': user.firstName,
      'password': user.password
    };

    final http.Response response = await http.post(
      apiCreate,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    print('Response: ${response.body}');

    if (response.statusCode == 201) {
      UserClass.fromJson(json.decode(response.body));
      return true;
    } else {
      print("ERROR: ${response.statusCode}");
      print('Falha ao criar usuario');
      return false;
    }
  }
}
