import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/src/models/establishment_models.dart';
import 'package:to_beauty_app/src/shared/constants.dart';

class EstabelecimentoController {
  final Uri apiUri = Uri.parse(API_URL);
  final Uri estabelecimentoCreate = Uri.parse(ESTABELECIMENTO_CREATE);

  Future<Estabelecimento> postEstabelecimento(
      Estabelecimento estabelecimento) async {
    Map data = {
      'nome': estabelecimento.nome,
      'cidade': estabelecimento.cidade,
      'bairro': estabelecimento.bairro,
      'rua': estabelecimento.rua,
      'numero': estabelecimento.numero,
      'cep': estabelecimento.cep,
      'telefone': estabelecimento.telefone,
      'latitude': estabelecimento.latitude,
      'longitude': estabelecimento.longitude,
      'user': estabelecimento.user
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
      return Estabelecimento.fromJson(json.decode(response.body));
    } else {
      print("Error: ${response.statusCode}");
      throw Exception('Falha ao criar estabelecimento');
    }
  }
}
