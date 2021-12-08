import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/agenda_models.dart';
import 'package:to_beauty_app/domain/service.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class AgendaController {
  final Uri agendaCreateUrl = Uri.parse(AppConstants.AGENDA_URL);

  Future<Agenda> postAgenda(Agenda agenda) async {
    Map data = {
      'estabelecimento': agenda.store,
      'servico': agenda.service,
      'data': agenda.date,
      'horario': agenda.timetable
    };

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    final http.Response response = await http.post(
      agendaCreateUrl,
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

  static Future<List<GetService>> getService(int id) async {
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
}
