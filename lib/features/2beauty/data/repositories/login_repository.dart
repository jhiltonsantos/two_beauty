// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_login_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@injectable
class LoginRepository implements ILoginRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.LOGIN_USER);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<bool> postLogin(modelClass) async {
    Map data = {
      "username": modelClass.username,
      "password": modelClass.password,
    };

    var prefs = await SharedPreferences.getInstance();
    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      LoginUserEntity.fromJson(mapResponse);
      prefs.setString('token', mapResponse["access"]);
      return true;
    } else {
      throw Exception('Falha ao realizar login');
    }
  }
}
