// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_owner_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

class OwnerRepository implements IOwnerRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.OWNER_POST_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<OwnerEntity> postNewOwner(modelClass) async {
    Map data = {
      "cpf": modelClass.cpf,
      "data_nascimento": modelClass.birthday,
      "telefone": modelClass.phone
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 201) {
      return OwnerEntity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar proprietario');
    }
  }
}
