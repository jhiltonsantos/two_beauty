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
import 'package:two_beauty/features/2beauty/data/models/user_access_model.dart';
import 'package:two_beauty/features/2beauty/data/models/user_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/sign_up_repository.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.USER_CREATE);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, UserAccessEntity>> postNewUser(
      UserEntity userEntity) async {
    http.Response response = await requestPostUser(userEntity);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (response.statusCode != StatusCode.CREATED) {
      return Left(ServerFailure());
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
}
