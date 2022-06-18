// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import "package:http/http.dart" as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_beauty/core/connection/web_client.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/platform/network_info.dart';
import 'package:two_beauty/features/2beauty/data/datasources/login_local_datasource.dart';
import 'package:two_beauty/features/2beauty/data/models/user_access_model.dart';
import 'package:two_beauty/features/2beauty/data/models/user_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/sign_up_repository.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final LoginLocalDataSource loginLocalData;
  final NetworkInfo networkInfo;
  @override
  Uri urlController = Uri.parse(AppConstants.USER_CREATE);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  SignUpRepositoryImpl(this.loginLocalData, this.networkInfo);

  @override
  Future<Either<Failure, UserAccessEntity>> postNewUser(
      UserEntity userEntity) async {
    if (!await networkInfo.isConnected) {
      return Left(ServerFailure());
    }
    return connectionNewUser(userEntity);
  }

  Future<Either<Failure, UserAccessEntity>> connectionNewUser(
      UserEntity userData) async {
    http.Response response = await requestPostUser(userData);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (response.statusCode != StatusCode.CREATED) {
      return Left(ServerFailure());
    }
    if (!await saveInCacheData(userData)) {
      return Left(CacheFailure());
    }
    return Right(createSignup(response, preferences));
  }

  // FUNCTIONS FOR postNewUser()
  Future<http.Response> requestPostUser(UserEntity userEntity) async {
    Map data = createJsonUser(userEntity);
    return await client.post(
      urlController,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
  }

  Map<dynamic, dynamic> createJsonUser(UserEntity userEntity) {
    return UserModel(
            username: userEntity.username,
            email: userEntity.email,
            firstName: userEntity.firstName,
            password: userEntity.password)
        .toJson();
  }

  UserAccessEntity createSignup(
      http.Response response, SharedPreferences prefs) {
    Map<String, dynamic> data = json.decode(response.body);
    prefs.setString('token', data["access"]);
    return UserAccessModel.fromJson(json.decode(response.body));
  }

  Future<bool> saveInCacheData(UserEntity userData) async {
    LoginGetTokenEntity loginData = LoginGetTokenEntity(
        username: userData.username, password: userData.password);
    return await loginLocalData.isLoginDataOnDB(loginData);
  }
}
