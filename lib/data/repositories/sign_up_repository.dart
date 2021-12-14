import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/domain/entities/user_models.dart';
import 'package:to_beauty_app/domain/repositories/sign_up_repository.dart';
import 'package:to_beauty_app/presentation/resources/connection_header.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class SignUpRepository implements ISignUpRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.USER_CREATE);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<bool> postNewUser(modelClass) async {
    Map data = {
      'username': modelClass.username,
      'email': modelClass.email,
      'first_name': modelClass.firstName,
      'password': modelClass.password
    };

    final http.Response response = await http.post(
      urlController,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      UserClass.fromJson(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
