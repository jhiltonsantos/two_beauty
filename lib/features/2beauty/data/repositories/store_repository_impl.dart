// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/store_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

@Injectable(as: StoreRepository)
class StoreRepositoryImpl implements StoreRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.STORE_GET_POST);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, StoreGetEntity>> getStoreData(String id) async {
    http.Response response =
        await requestGetStore(url: Uri.parse("${AppConstants.STORE_URL}/$id"));
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(storeDataByID(response));
  }

  @override
  Future<Either<Failure, List<StoreGetEntity>>> getAllStoreData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final services = <StoreGetEntity>[];
      for (Map<String, dynamic> map in listResponse) {
        StoreGetEntity service = StoreGetEntity.fromJson(map);
        services.add(service);
      }
      return Right(services);
    } else {
      throw Exception('Falha ao carregar estabelecimentos');
    }
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
      'latitude': storeEntity.latitude,
      'longitude': storeEntity.longitude,
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 201) {
      return Right(StoreEntity.fromJson(json.decode(response.body)));
    } else {
      // throw Exception('Falha ao criar estabelecimento');
      return Left(ServerFailure());
    }
  }

  // FUNCTIONS FOR getStoreData
  Future<http.Response> requestGetStore({required Uri url}) async {
    return await connectionHeaderApi.getResponse(url);
  }

  StoreGetEntity storeDataByID(http.Response response) {
    Map<String, dynamic> map = json.decode(response.body);
    StoreGetEntity store = StoreGetEntity.fromJson(map);
    return store;
  }
}
