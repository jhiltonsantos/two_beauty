import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/src/models/establishment_models.dart';
import 'package:to_beauty_app/src/shared/constants.dart';

class EstabelecimentoApi {
  static Future<List<Estabelecimento>> getAllEstabelecimentos() async {
    final Uri estabelecimentoUrl = Uri.parse(ESTABELECIMENTO);
    int id = 1;
    final Uri estabelecimentoById = Uri.parse('$ESTABELECIMENTO/$id');

    // Recuperando o token do login
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    print("Token API: $token");

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(estabelecimentoUrl, headers: header);
    print("Status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final estabelecimentos = <Estabelecimento>[];

      for (Map<String, dynamic> map in listResponse) {
        Estabelecimento estab = Estabelecimento.fromJson(map);
        estabelecimentos.add(estab);
      }
      return estabelecimentos;
    } else {
      throw Exception('Falha ao carregar estabelecimentos');
    }
  }
}
