import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/service.dart';
import 'package:to_beauty_app/domain/store_get_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class StoreDetailController {
  static Future<List<GetStore>> getAllData(int id) async {
    final Uri storeDetailUrl = Uri.parse("${AppConstants.STORE_URL}/$id");

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(storeDetailUrl, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listStore = <GetStore>[];
      GetStore store = GetStore.fromJson(map);
      listStore.add(store);
      return listStore;
    } else {
      throw Exception('Falha ao carregar estabelecimento');
    }
  }

  static Future<List<GetService>> getAllServices() async {
    final Uri servicesUrl = Uri.parse(AppConstants.SERVICE_ALL_URL);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(servicesUrl, headers: header);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final services = <GetService>[];
      for (Map<String, dynamic> map in listResponse) {
        GetService service = GetService.fromJson(map);
        services.add(service);
      }
      return services;
    } else {
      throw Exception('Falha ao carregar servicos');
    }
  }
}
