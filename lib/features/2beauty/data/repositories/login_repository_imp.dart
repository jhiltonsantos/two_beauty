// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_response_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.LOGIN_USER);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, UserAccessResponseEntity>> postLogin(
      LoginGetTokenEntity loginGetTokenEntity) async {
    Map data = {
      "username": loginGetTokenEntity.username,
      "password": loginGetTokenEntity.password,
    };

    var prefs = await SharedPreferences.getInstance();
    http.Response response =
        await connectionHeaderApi.postResponse(urlController, data);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      UserAccessResponseEntity.fromJson(mapResponse);
      prefs.setString('token', mapResponse["access"]);
      UserAccessResponseEntity userLoginData =
          UserAccessResponseEntity.fromJson(json.decode(response.body));
      return Right(userLoginData);
    } else {
      // throw Exception('Falha ao realizar login');
      return Left(ServerFailure());
    }
  }
}
