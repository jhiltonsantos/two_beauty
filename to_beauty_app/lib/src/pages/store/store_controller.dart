import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/src/models/store_models.dart';
import 'package:to_beauty_app/src/shared/constants.dart';

class StorePostController {
  final Uri apiUri = Uri.parse(API_URL);
  final Uri estabelecimentoCreate = Uri.parse(STORE_URL);

  Future<Store> postStore(Store store) async {
    Map data = {
      'nome': store.name,
      'cidade': store.city,
      'bairro': store.district,
      'rua': store.street,
      'numero': store.number,
      'cep': store.cep,
      'telefone': store.phone,
      'latitude': store.latitude,
      'longitude': store.longitude,
      'user': store.user
    };

    final http.Response response = await http.post(
      estabelecimentoCreate,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
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
