import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/store_get_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class StoreGetController {
  static Future<List<GetStore>> getAllEstabelecimentos() async {
    final Uri storeUrl = Uri.parse(AppConstants.STORE_GET_POST);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(storeUrl, headers: header);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final estabelecimentos = <GetStore>[];

      for (Map<String, dynamic> map in listResponse) {
        GetStore store = GetStore.fromJson(map);
        estabelecimentos.add(store);
      }
      return estabelecimentos;
    } else {
      throw Exception('Falha ao carregar estabelecimentos');
    }
  }
}

class HomeController {
  static Future<String> getUserData() async {
    final Uri getName = Uri.parse(AppConstants.USER_GET_NAME);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(getName, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      String data = mapResponse["username"];
      return data;
    } else {
      throw Exception('Falha ao carregar usuarios');
    }
  }
}
