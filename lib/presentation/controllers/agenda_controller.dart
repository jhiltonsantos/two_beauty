import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/agenda_models.dart';
import 'package:to_beauty_app/presentation/controllers/controller_general.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class AgendaController implements ControllerGeral {
  @override
  Uri urlController = Uri.parse(AppConstants.AGENDA_URL);

  @override
  Future<Agenda> postData(modelClass) async {
    Map data = {
      'estabelecimento': modelClass.store,
      'servico': modelClass.service,
      'data': modelClass.date,
      'horario': modelClass.timetable
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
      return Agenda.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar agenda');
    }
  }

  @override
  Future<List> getData(id) async {
    throw UnimplementedError();
  }

  @override
  Future<List> getAllData() {
    throw UnimplementedError();
  }
}
