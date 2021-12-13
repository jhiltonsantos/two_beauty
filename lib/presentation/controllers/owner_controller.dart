import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/owner_model.dart';
import 'package:to_beauty_app/presentation/controllers/controller_general.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class OwnerController implements ControllerGeral {
  @override
  Uri urlController = Uri.parse(AppConstants.OWNER_POST_URL);

  @override
  Future<Owner> postData(modelClass) async {
    Map data = {
      "cpf": modelClass.cpf,
      "data_nascimento": modelClass.birthday,
      "telefone": modelClass.phone
    };

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');

    final http.Response response = await http.post(
      urlController,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      return Owner.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falha ao criar proprietario');
    }
  }

  @override
  Future<List> getAllData() {
    throw UnimplementedError();
  }

  @override
  Future<List> getData(id) {
    throw UnimplementedError();
  }
}
