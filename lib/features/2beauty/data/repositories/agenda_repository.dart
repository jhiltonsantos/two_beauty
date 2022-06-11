// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/data/models/agenda_get_model.dart';
import 'package:two_beauty/features/2beauty/data/models/agenda_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/agenda_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_agenda_repository.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

@injectable
class AgendaRepository implements IAgendaRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.AGENDA_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, List<AgendaGetEntity>>> getAllAgendaData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode != 200) {
      return Left(ServerFailure());
    }
    List listResponse = json.decode(response.body);
    final listAgenda = <AgendaGetEntity>[];
    for (Map<String, dynamic> map in listResponse) {
      AgendaGetEntity agenda = AgendaGetModel.fromJson(map);
      listAgenda.add(agenda);
    }
    return Right(listAgenda);
  }

  @override
  Future<Either<Failure, AgendaEntity>> postAgendaData(
      AgendaEntity agendaEntity) async {
    Map data = {
      'estabelecimento': agendaEntity.store,
      'servico': agendaEntity.service,
      'data': agendaEntity.date,
      'horario': agendaEntity.timetable
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode != 201) {
      return Left(ServerFailure());
    }
    return Right(AgendaModel.fromJson(json.decode(response.body)));
  }
}
