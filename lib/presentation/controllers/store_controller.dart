import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/store_models.dart';
import 'package:to_beauty_app/presentation/controllers/controller_general.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class StoreController implements ControllerGeral {
  @override
  Uri urlController = Uri.parse(AppConstants.STORE_GET_POST);

  @override
  Future<Store> postData(modelClass) async {
    Map data = {
      'nome': modelClass.name,
      'cnpj': modelClass.cnpj,
      'cidade': modelClass.city,
      'bairro': modelClass.district,
      'rua': modelClass.street,
      'numero': modelClass.number,
      'cep': modelClass.cep,
      'horario_inicio': modelClass.openHour,
      'horario_final': modelClass.closeHour,
      'telefone': modelClass.phone,
      'latitude': modelClass.latitude,
      'longitude': modelClass.longitude,
    };

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');

    final http.Response response = await http.post(
      urlController,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      return Store.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar estabelecimento');
    }
  }

  @override
  Future<List<GetStore>> getAllData() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(urlController, headers: header);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final services = <GetStore>[];
      for (Map<String, dynamic> map in listResponse) {
        GetStore service = GetStore.fromJson(map);
        services.add(service);
      }
      return services;
    } else {
      throw Exception('Falha ao carregar estabelecimentos');
    }
  }

  @override
  Future<List<GetStore>> getData(id) async {
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
}
