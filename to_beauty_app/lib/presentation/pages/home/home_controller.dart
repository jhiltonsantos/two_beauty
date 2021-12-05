import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/store_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class StoreGetController {
  static Future<List<Store>> getAllEstabelecimentos() async {
    final Uri storeUrl = Uri.parse(AppConstants.STORE_URL);

    // Recuperando o token do login
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("Token API Estabelecimento: $token");

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(storeUrl, headers: header);
    print("Status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final estabelecimentos = <Store>[];

      for (Map<String, dynamic> map in listResponse) {
        Store store = Store.fromJson(map);
        estabelecimentos.add(store);
      }
      return estabelecimentos;
    } else {
      throw Exception('Falha ao carregar estabelecimentos');
    }
  }
}

class HomeController {
  static Future<String> getUserName() async {
    final Uri getName = Uri.parse(AppConstants.USER_GET_NAME);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("Token Nome do Usuario: $token");

    var header = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(getName, headers: header);
    print("Status code USERNAME: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("Corpo: ${response.body}");
      Map<String, dynamic> mapResponse = json.decode(response.body);
      String data = mapResponse["username"];

      print("Name: ${mapResponse["username"]}");

      /*for (Map<String, dynamic> map in mapResponse) {
        UserData userClass = UserData.fromJson(map);
        user.add(userClass);
      }

      print(user); */
      print("Depois do user");
      return data;
    } else {
      throw Exception('Falha ao carregar usuarios');
    }
  }
}
