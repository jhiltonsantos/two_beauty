// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:two_beauty/features/2beauty/domain/entities/service_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_service_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

class ServiceRepository implements IServiceRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.SERVICE_ALL_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<List<ServiceGetEntity>> getData(id) async {
    final Uri url = Uri.parse('${AppConstants.SERVICE_ALL_URL}/$id');
    http.Response response = await connectionHeaderApi.getResponse(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listService = <ServiceGetEntity>[];
      ServiceGetEntity service = ServiceGetEntity.fromJson(map);
      listService.add(service);
      return listService;
    } else {
      throw Exception('Falha ao carregar servico');
    }
  }

  @override
  Future<List<ServiceGetEntity>> getAllData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final services = <ServiceGetEntity>[];
      for (Map<String, dynamic> map in listResponse) {
        ServiceGetEntity service = ServiceGetEntity.fromJson(map);
        services.add(service);
      }
      return services;
    } else {
      throw Exception('Falha ao carregar servicos');
    }
  }

  @override
  Future<ServiceEntity> postData(modelClass) async {
    Map data = {
      "estabelecimento": modelClass.store,
      "nome": modelClass.name,
      "descricao": modelClass.description,
      "preco": modelClass.price,
      "qtd_atendentes": modelClass.countAttendants,
      "duracao": modelClass.durationMinutes,
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 201) {
      return ServiceEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar servico');
    }
  }
}
