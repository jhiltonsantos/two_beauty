import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/store_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class StoreGetController {
  static Future<List<Store>> getAllEstabelecimentos() async {
    final Uri storeUrl = Uri.parse(AppStrings.STORE_URL);

    // Recuperando o token do login
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("Token API: $token");

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


/* class StoreGetController {
  static Future<List<Store>> getAllEstabelecimentos() async {
    final Uri storeUrl = Uri.parse(STORE_URL);

    // Recuperando o token do login
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("Token API: $token");

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
} */

