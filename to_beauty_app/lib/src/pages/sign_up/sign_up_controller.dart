import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/src/models/user_models.dart';
import 'package:to_beauty_app/src/shared/constants.dart';

class ApiController {
  final Uri apiUri = Uri.parse(API_URL);
  final Uri apiCreate = Uri.parse(USER_CREATE);

  Future<bool> createUser(UserClass user) async {
    Map data = {
      'username': user.username,
      'email': user.email,
      'first_name': user.first_name,
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
