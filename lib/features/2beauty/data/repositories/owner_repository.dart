// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_owner_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

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
      return Right(OwnerEntity.fromJson(json.decode(response.body)));
    } else {
      // throw Exception('Falha ao criar proprietario');
      return Left(ServerFailure());
    }
  }
}
