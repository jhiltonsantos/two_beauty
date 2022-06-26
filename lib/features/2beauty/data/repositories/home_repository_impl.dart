// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/data/models/user_get_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/home_repository.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Uri urlController = Uri.parse(AppConstants.USER_GET_NAME);

  @override
  Future<Either<Failure, UserGetEntity>> getUserData() async {
    http.Response response = await requestGetUser();
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(getData(response));
  }

  // FUNCTIONS FOR getUserData()
  Future<http.Response> requestGetUser() async {
    return await connectionHeaderApi.getHeader(urlController);
  }

  UserGetEntity getData(http.Response response) {
    Map<String, dynamic> map = json.decode(response.body);
    final UserGetEntity user = UserGetModel.fromJson(map);
    return user;
  }
}
