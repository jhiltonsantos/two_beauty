// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/connection_header.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/data/models/store_get_model.dart';
import 'package:two_beauty/features/2beauty/data/models/store_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/store_repository.dart';

@Injectable(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.STORE_GET_POST);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, StoreGetEntity>> getStoreData(String id) async {
    Uri urlGetByID = Uri.parse("${AppConstants.STORE_URL}/$id");
    http.Response response = await requestGetStore(url: urlGetByID);
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(storeDataByID(response));
  }

  @override
  Future<Either<Failure, List<StoreGetEntity>>> getAllStoreData() async {
    http.Response response = await requestGetStore();
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(storesData(response));
  }

  @override
  Future<Either<Failure, StoreEntity>> postStoreData(
      StoreEntity storeEntity) async {
    Map data = {
      'nome': storeEntity.name,
      'cnpj': storeEntity.cnpj,
      'cidade': storeEntity.city,
      'bairro': storeEntity.district,
      'rua': storeEntity.street,
      'numero': storeEntity.number,
      'cep': storeEntity.cep,
      'horario_inicio': storeEntity.openHour,
      'horario_final': storeEntity.closeHour,
      'telefone': storeEntity.phone,
      'latitude': '798844554',
      'longitude': '-23212',
      'data_cadastro': DateFormat("yyyy-MM-dd").format(DateTime.now()),
      'proprietario': 1
    };

    http.Response response =
        await connectionHeaderApi.postHeader(urlController, data);

    if (response.statusCode == 201) {
      return Right(StoreModel.fromJson(json.decode(response.body)));
    } else {
      return Left(ServerFailure());
    }
  }

  Future<http.Response> requestGetStore({Uri? url}) async {
    return await connectionHeaderApi.getHeader(url ?? urlController);
  }

  // FUNCTIONS FOR getStoreData
  StoreGetEntity storeDataByID(http.Response response) {
    Map<String, dynamic> map = json.decode(response.body);
    StoreGetEntity store = StoreGetModel.fromJson(map);
    return store;
  }

  // FUNCTIONS FOR getAllStoreData
  List<StoreGetEntity> storesData(http.Response response) {
    List listResponse = json.decode(response.body);
    final List<StoreGetEntity> stores = <StoreGetEntity>[];
    for (Map<String, dynamic> map in listResponse) {
      StoreGetEntity store = StoreGetModel.fromJson(map);
      stores.add(store);
    }
    return stores;
  }
}
