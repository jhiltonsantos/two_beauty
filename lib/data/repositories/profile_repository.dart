import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:two_beauty/domain/entities/user_models.dart';
import 'package:two_beauty/domain/repositories/profile_repository.dart';
import 'package:two_beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/presentation/resources/strings_manager.dart';


class ProfileRepository implements IProfileRepository {
  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Uri urlController = Uri.parse(AppConstants.PROFILE_GET);

  @override
  Future<List<UserData>> getData(id) async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

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

  Future<int> getUserId() async {
    final Uri getIdUrl = Uri.parse(AppConstants.USER_GET_NAME);
    http.Response response = await connectionHeaderApi.getResponse(getIdUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      int data = mapResponse["id"];
      return data;
    } else {
      throw Exception('Falha ao carregar usuarios');
    }
  }
}
