import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:to_beauty_app/domain/entities/store_models.dart';
import 'package:to_beauty_app/domain/repositories/store_repository.dart';
import 'package:to_beauty_app/presentation/resources/connection_header.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class StoreRepository implements IStoreRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.STORE_GET_POST);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Store> postData(modelClass) async {
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
      return Store.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar estabelecimento');
    }
  }

  @override
  Future<List<GetStore>> getAllData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final services = <GetStore>[];
      for (Map<String, dynamic> map in listResponse) {
        GetStore service = GetStore.fromJson(map);
        services.add(service);
      }
      return services;
    } else {
      throw Exception('Falha ao carregar estabelecimentos');
    }
  }

  @override
  Future<List<GetStore>> getData(id) async {
    final Uri storeDetailUrl = Uri.parse("${AppConstants.STORE_URL}/$id");

    http.Response response =
        await connectionHeaderApi.getResponse(storeDetailUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listStore = <GetStore>[];
      GetStore store = GetStore.fromJson(map);
      listStore.add(store);
      return listStore;
    } else {
      throw Exception('Falha ao carregar estabelecimento');
    }
  }
}
