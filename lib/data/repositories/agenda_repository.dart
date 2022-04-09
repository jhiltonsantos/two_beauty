import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:two_beauty/domain/entities/agenda_models.dart';
import 'package:two_beauty/domain/repositories/agenda_repository.dart';
import 'package:two_beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/presentation/resources/strings_manager.dart';

class AgendaRepository implements IAgendaRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.AGENDA_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Agenda> postData(modelClass) async {
    Map data = {
      'estabelecimento': modelClass.store,
      'servico': modelClass.service,
      'data': modelClass.date,
      'horario': modelClass.timetable
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode != 201) {
      throw Exception('Falha ao criar agenda');
    }
    return Agenda.fromJson(json.decode(response.body));
  }

  @override
  Future<List<GetAgenda>> getAllData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar agenda do usuario');
    }
    List listResponse = json.decode(response.body);
    final listAgenda = <GetAgenda>[];
    for (Map<String, dynamic> map in listResponse) {
      GetAgenda agenda = GetAgenda.fromJson(map);
      listAgenda.add(agenda);
    }
    return listAgenda;
  }
}
