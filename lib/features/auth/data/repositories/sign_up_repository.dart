// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';
import 'package:two_beauty/features/auth/domain/repositories/I_sign_up_repository.dart';

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
      UserEntity.fromJson(json.decode(response.body));
      return true;
    } else {
      return false;
    }
  }
}
