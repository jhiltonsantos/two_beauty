import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/presentation/resources/connection_header.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class HomeController {
  static Future<String> getUserData() async {
    final Uri getName = Uri.parse(AppConstants.USER_GET_NAME);
    ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();
    http.Response response = await connectionHeaderApi.getResponse(getName);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      String data = mapResponse["username"];
      return data;
    } else {
      throw Exception('Falha ao carregar usuarios');
    }
  }
}
