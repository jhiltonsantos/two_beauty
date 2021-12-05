import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/store_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class StorePostController {
  final Uri apiUri = Uri.parse(AppConstants.API_URL);
  final Uri estabelecimentoCreate = Uri.parse(AppConstants.STORE_URL);

  Future<Store> postStore(Store store) async {
    Map data = {
      'nome': store.name,
      'cnpj': store.cnpj,
      'cidade': store.city,
      'bairro': store.district,
      'rua': store.street,
      'numero': store.number,
      'cep': store.cep,
      'horario_inicio': store.openHour,
      'horario_final': store.closeHour,
      'telefone': store.phone,
      'latitude': store.latitude,
      'longitude': store.longitude,
    };

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("Token API Create Store: $token");

    final http.Response response = await http.post(
      estabelecimentoCreate,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );

    print('Response: ${response.body}');

    if (response.statusCode == 201) {
      return Store.fromJson(json.decode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      throw Exception('Falha ao criar estabelecimento');
    }
  }
}
