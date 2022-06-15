// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/data/models/service_get_model.dart';
import 'package:two_beauty/features/2beauty/data/models/service_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_service_repository.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

@injectable
class ServiceRepository implements IServiceRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.SERVICE_ALL_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, List<ServiceGetEntity>>> getServiceData(
      String id) async {
    final Uri url = Uri.parse('${AppConstants.SERVICE_ALL_URL}/$id');
    http.Response response = await connectionHeaderApi.getHeader(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listService = <ServiceGetEntity>[];
      ServiceGetEntity service = ServiceGetModel.fromJson(map);
      listService.add(service);
      return Right(listService);
    } else {
      // throw Exception('Falha ao carregar servico');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ServiceGetEntity>>> getAllServiceData() async {
    http.Response response = await connectionHeaderApi.getHeader(urlController);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final services = <ServiceGetEntity>[];
      for (Map<String, dynamic> map in listResponse) {
        ServiceGetEntity service = ServiceGetModel.fromJson(map);
        services.add(service);
      }
      return Right(services);
    } else {
      // throw Exception('Falha ao carregar servicos');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ServiceEntity>> postServiceData(
      ServiceEntity serviceEntity) async {
    Map data = {
      "estabelecimento": serviceEntity.store,
      "nome": serviceEntity.name,
      "descricao": serviceEntity.description,
      "preco": serviceEntity.price,
      "qtd_atendentes": serviceEntity.countAttendants,
      "duracao": serviceEntity.durationMinutes,
    };

    http.Response response =
        await connectionHeaderApi.postHeader(urlController, data);

    if (response.statusCode == 201) {
      return Right(ServiceModel.fromJson(json.decode(response.body)));
    } else {
      // throw Exception('Falha ao criar servico');
      return Left(ServerFailure());
    }
  }
}
