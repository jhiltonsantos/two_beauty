// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/data/models/owner_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_owner_repository.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

@injectable
class OwnerRepository implements IOwnerRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.OWNER_POST_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, OwnerEntity>> postNewOwner(
      OwnerEntity ownerEntity) async {
    Map data = {
      "cpf": ownerEntity.cpf,
      "data_nascimento": ownerEntity.birthday,
      "telefone": ownerEntity.phone
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 201) {
      return Right(OwnerModel.fromJson(json.decode(response.body)));
    } else {
      // throw Exception('Falha ao criar proprietario');
      return Left(ServerFailure());
    }
  }
}
