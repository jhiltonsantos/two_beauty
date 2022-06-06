// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/home_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImp implements HomeRepository {
  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Uri urlController = Uri.parse(AppConstants.USER_GET_NAME);

  @override
  Future<Either<Failure, String>> getUserData() async {
    http.Response response =
        await requestGetUser(connectionHeaderApi, urlController);
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(getUsername(response));
  }

  Future<http.Response> requestGetUser(
      ConnectionHeaderApi connection, Uri uri) async {
    return await connectionHeaderApi.getResponse(urlController);
  }

  String getUsername(http.Response response) {
    Map<String, dynamic> map = json.decode(response.body);
    return map["username"];
  }
}
