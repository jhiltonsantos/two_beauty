import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/service_model.dart';
import 'package:to_beauty_app/presentation/controllers/controller_general.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class ServiceController implements ControllerGeral {
  @override
  Uri urlController = Uri.parse(AppConstants.SERVICE_ALL_URL);

  @override
  Future<List<GetService>> getData(id) async {
    final Uri servicesUrl = Uri.parse('${AppConstants.SERVICE_ALL_URL}/$id');

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');

    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    var response = await http.get(servicesUrl, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listService = <GetService>[];
      GetService service = GetService.fromJson(map);
      listService.add(service);
      return listService;
    } else {
      throw Exception('Falha ao carregar servico');
    }
  }

  @override
  Future<List<GetService>> getAllData() async {
    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(urlController, headers: header);

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

  @override
  Future<Service> postData(modelClass) async {
    Map data = {
      "estabelecimento": modelClass.store,
      "nome": modelClass.name,
      "descricao": modelClass.description,
      "preco": modelClass.price,
      "qtd_atendentes": modelClass.countAttendants,
      "duracao": modelClass.durationMinutes,
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
      return Service.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar servico');
    }
  }
}
