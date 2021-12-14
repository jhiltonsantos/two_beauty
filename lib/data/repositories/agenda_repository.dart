import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/domain/entities/agenda_models.dart';
import 'package:to_beauty_app/domain/repositories/agenda_repository.dart';
import 'package:to_beauty_app/presentation/resources/connection_header.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

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

    if (response.statusCode == 201) {
      return Agenda.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar agenda');
    }
  }

  @override
  Future<List<GetAgenda>> getAllData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final listAgenda = <GetAgenda>[];
      for (Map<String, dynamic> map in listResponse) {
        GetAgenda agenda = GetAgenda.fromJson(map);
        listAgenda.add(agenda);
      }
      return listAgenda;
    } else {
      throw Exception('Falha ao carregar agenda do usuario');
    }
  }
}
