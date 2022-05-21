// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_store_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

class StoreRepository implements IStoreRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.STORE_GET_POST);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<StoreEntity> postStoreData(modelClass) async {
    Map data = {
      'nome': modelClass.name,
      'cnpj': modelClass.cnpj,
      'cidade': modelClass.city,
      'bairro': modelClass.district,
      'rua': modelClass.street,
      'numero': modelClass.number,
      'cep': modelClass.cep,
      'horario_inicio': modelClass.openHour,
      'horario_final': modelClass.closeHour,
      'telefone': modelClass.phone,
      'latitude': modelClass.latitude,
      'longitude': modelClass.longitude,
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 201) {
      return StoreEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar estabelecimento');
    }
  }

  @override
  Future<List<StoreGetEntity>> getAllStoreData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final services = <StoreGetEntity>[];
      for (Map<String, dynamic> map in listResponse) {
        StoreGetEntity service = StoreGetEntity.fromJson(map);
        services.add(service);
      }
      return services;
    } else {
      throw Exception('Falha ao carregar estabelecimentos');
    }
  }

  @override
  Future<List<StoreGetEntity>> getStoreData(id) async {
    final Uri storeDetailUrl = Uri.parse("${AppConstants.STORE_URL}/$id");

    http.Response response =
        await connectionHeaderApi.getResponse(storeDetailUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listStore = <StoreGetEntity>[];
      StoreGetEntity store = StoreGetEntity.fromJson(map);
      listStore.add(store);
      return listStore;
    } else {
      throw Exception('Falha ao carregar estabelecimento');
    }
  }
}
