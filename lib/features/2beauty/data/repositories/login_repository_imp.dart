// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.LOGIN_USER);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, UserAccessEntity>> postLogin(
      LoginGetTokenEntity loginGetTokenEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await requestPostLogin(loginGetTokenEntity);
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(userAccess(response, prefs));
  }

  UserAccessEntity userAccess(http.Response response, SharedPreferences prefs) {
    Map<String, dynamic> data = json.decode(response.body);
    UserAccessEntity.fromJson(data);
    prefs.setString('token', data["access"]);
    return UserAccessEntity.fromJson(json.decode(response.body));
  }

  Future<http.Response> requestPostLogin(
      LoginGetTokenEntity loginGetTokenEntity) async {
    Map data = createJsonLogin(loginGetTokenEntity);
    return await connectionHeaderApi.postResponse(urlController, data);
  }

  Map<dynamic, dynamic> createJsonLogin(
      LoginGetTokenEntity loginGetTokenEntity) {
    return LoginGetTokenEntity(
            username: loginGetTokenEntity.username,
            password: loginGetTokenEntity.password)
        .toJson();
  }
}
