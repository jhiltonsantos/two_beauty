import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_beauty_app/domain/agenda_models.dart';
import 'package:to_beauty_app/domain/owner_model.dart';
import 'package:to_beauty_app/domain/user_models.dart';
import 'package:to_beauty_app/presentation/resources/strings_manager.dart';

class ProfileController {
  static Future<List<UserData>> getUserData() async {
    final Uri profileUrl = Uri.parse(AppConstants.PROFILE_GET);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(profileUrl, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listUsers = <UserData>[];
      UserData user = UserData.fromJson(map);
      listUsers.add(user);
      return listUsers;
    } else {
      throw Exception('Falha ao carregar usuario');
    }
  }

  static Future<List<GetAgenda>> getAgendaUserData() async {
    final Uri profileAgendaUrl = Uri.parse(AppConstants.AGENDA_URL);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(profileAgendaUrl, headers: header);

    if (response.statusCode == 200) {
      List listResponse = json.decode(response.body);
      final listAgenda = <GetAgenda>[];
      for (Map<String, dynamic> map in listResponse) {
        GetAgenda agenda = GetAgenda.fromJson(map);
        listAgenda.add(agenda);
      }
      return listAgenda;
    } else {
      throw Exception('Falha ao carregar agenda do usuario');
    }
  }

  static Future<int> getUserId() async {
    final Uri getId = Uri.parse(AppConstants.USER_GET_NAME);

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');
    var header = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var response = await http.get(getId, headers: header);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      int data = mapResponse["id"];
      return data;
    } else {
      throw Exception('Falha ao carregar usuarios');
    }
  }

  Future<Owner> postOwner(Owner owner) async {
    final Uri ownerUrl = Uri.parse(AppConstants.OWNER_POST_URL);

    Map data = {
      "cpf": owner.cpf,
      "data_nascimento": owner.birthday,
      "telefone": owner.phone
    };

    var prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('token') ?? '');

    final http.Response response = await http.post(
      ownerUrl,
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
}
