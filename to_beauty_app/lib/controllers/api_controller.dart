import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/models/user_models.dart';
import 'package:to_beauty_app/shared/constants.dart';

class ApiController {
  final Uri apiUri = Uri.parse(API_URL);
  final Uri apiCreate = Uri.parse(API_CREATE);

  Future<UserClass> createUser(UserClass user) async {
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
      return UserClass.fromJson(json.decode(response.body));
    } else {
      print("ERROR: ${response.statusCode}");
      throw Exception('Falha ao criar usuario');
    }
  }
}
