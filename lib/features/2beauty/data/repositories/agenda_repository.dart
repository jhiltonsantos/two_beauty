// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_agenda_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@injectable
class AgendaRepository implements IAgendaRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.AGENDA_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<List<AgendaGetEntity>> getAllAgendaData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode != 200) {
      throw Exception('Falha ao carregar agenda do usuario');
    }
    List listResponse = json.decode(response.body);
    final listAgenda = <AgendaGetEntity>[];
    for (Map<String, dynamic> map in listResponse) {
      AgendaGetEntity agenda = AgendaGetEntity.fromJson(map);
      listAgenda.add(agenda);
    }
    return listAgenda;
  }

  @override
  Future<AgendaEntity> postAgendaData(modelClass) async {
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
    return AgendaEntity.fromJson(json.decode(response.body));
  }
}
