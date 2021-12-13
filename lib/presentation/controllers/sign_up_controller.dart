import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/domain/user_models.dart';
import 'package:to_beauty_app/presentation/controllers/controller_general.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class ApiController implements ControllerGeral {
  @override
  Uri urlController = Uri.parse(AppConstants.USER_CREATE);

  @override
  Future<bool> postData(modelClass) async {
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

  @override
  Future<List> getData(id) {
    // TODO: implement getData
    throw UnimplementedError();
  }

  @override
  Future<List> getAllData() {
    // TODO: implement getAllData
    throw UnimplementedError();
  }
}
