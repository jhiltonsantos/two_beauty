// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/connection_header.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/platform/network_info.dart';
import 'package:two_beauty/features/2beauty/data/models/owner_get_model.dart';
import 'package:two_beauty/features/2beauty/data/models/owner_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/owner_repository.dart';

@Injectable(as: OwnerRepository)
class OwnerRepositoryImpl implements OwnerRepository {
  final NetworkInfo networkInfo;

  @override
  Uri urlController = Uri.parse(AppConstants.OWNER_POST_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  OwnerRepositoryImpl({required this.networkInfo});

  @override
  Future<Either<Failure, OwnerEntity>> postNewOwner(
      OwnerEntity ownerEntity) async {
    Map data = {
      "cpf": ownerEntity.cpf,
      "data_nascimento": ownerEntity.birthday,
      "telefone": ownerEntity.phone
    };

    http.Response response =
        await connectionHeaderApi.postHeader(urlController, data);

    if (response.statusCode == 201) {
      return Right(OwnerModel.fromJson(json.decode(response.body)));
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OwnerGetEntity>> getOwnerData() async {
    if (await networkInfo.isConnected) {
      http.Response response = await requestGetOwner();
      if (response.statusCode == StatusCode.INTERNAL_SERVER_ERROR) {
        return Left(InternalServerFailure());
      } else {
        if (response.statusCode != StatusCode.OK) {
          return Left(ServerFailure());
        }
        return Right(getData(response));
      }
    } else {
      return Left(ServerFailure());
    }
  }

  Future<http.Response> requestGetOwner() async {
    return await connectionHeaderApi
        .getHeader(Uri.parse(AppConstants.OWNER_GET_URL));
  }

  OwnerGetEntity getData(http.Response response) {
    Map<String, dynamic> map = json.decode(response.body);
    final OwnerGetEntity owner = OwnerGetModel.fromJson(map);
    return owner;
  }
}
