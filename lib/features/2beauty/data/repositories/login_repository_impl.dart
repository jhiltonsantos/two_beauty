// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/connection_header.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/platform/network_info.dart';
import 'package:two_beauty/features/2beauty/data/datasources/login_local_datasource.dart';
import 'package:two_beauty/features/2beauty/data/models/login_get_token_model.dart';
import 'package:two_beauty/features/2beauty/data/models/user_access_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginLocalDataSource loginLocalData;
  final NetworkInfo networkInfo;
  final boolean = true;

  @override
  Uri urlController = Uri.parse(AppConstants.LOGIN_USER);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  LoginRepositoryImpl(
      {required this.loginLocalData, required this.networkInfo});

  @override
  Future<Either<Failure, LoginGetTokenEntity>> getLogin() async {
    late LoginGetTokenEntity login;
    bool isHaveData = true;
    await loginLocalData.getLoginDataFromDB().then((loginData) {
      loginData.fold(
        (valueFalse) => isHaveData = valueFalse,
        (data) => login = data,
      );
    });
    if (!isHaveData) {
      return Left(CacheFailure());
    }
    return Right(login);
  }

  @override
  Future<Either<Failure, UserAccessEntity>> postLogin(
      LoginGetTokenEntity loginGetTokenEntity) async {
    if (await networkInfo.isConnected) {
      return connectLogin(loginGetTokenEntity);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<bool> logoutUser() async {
    late bool isLogout;
    await loginLocalData.removeLoginDataFromDB().then((value) {
      isLogout = value;
    });
    return isLogout;
  }

  Future<Either<Failure, UserAccessEntity>> connectLogin(
      LoginGetTokenEntity loginGetTokenEntity) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    http.Response response = await requestPostLogin(loginGetTokenEntity);
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    if (!await saveInCacheData(loginGetTokenEntity)) {
      return Left(CacheFailure());
    }
    return Right(userAccess(response, prefs));
  }

  UserAccessEntity userAccess(http.Response response, SharedPreferences prefs) {
    Map<String, dynamic> data = json.decode(response.body);
    UserAccessModel.fromJson(data);
    prefs.setString('token', data["access"]);
    return UserAccessModel.fromJson(json.decode(response.body));
  }

  Future<http.Response> requestPostLogin(
      LoginGetTokenEntity loginGetTokenEntity) async {
    Map data = createJsonLogin(loginGetTokenEntity);
    return await connectionHeaderApi.postHeader(urlController, data);
  }

  Map<dynamic, dynamic> createJsonLogin(
      LoginGetTokenEntity loginGetTokenEntity) {
    return LoginGetTokenModel(
            username: loginGetTokenEntity.username,
            password: loginGetTokenEntity.password)
        .toJson();
  }

  Future<bool> saveInCacheData(LoginGetTokenEntity loginData) async {
    return await loginLocalData.isLoginDataOnDB(loginData);
  }
}
