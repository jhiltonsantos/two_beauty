import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_beauty_app/domain/entities/owner_model.dart';
import 'package:to_beauty_app/domain/repositories/owner_repository.dart';
import 'package:to_beauty_app/presentation/resources/connection_header.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class OwnerRepository implements IOwnerRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.OWNER_POST_URL);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Owner> postNewOwner(modelClass) async {
    Map data = {
      "cpf": modelClass.cpf,
      "data_nascimento": modelClass.birthday,
      "telefone": modelClass.phone
    };

    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 201) {
      return Owner.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar proprietario');
    }
  }
}
