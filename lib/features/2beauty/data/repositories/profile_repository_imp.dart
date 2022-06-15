// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/constants/app_constants.dart';
import 'package:two_beauty/core/constants/status_code_constants.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/data/models/user_model.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/profile_repository.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImp implements ProfileRepository {
  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Uri urlController = Uri.parse(AppConstants.PROFILE_GET);

  @override
  Future<Either<Failure, List<UserEntity>>> getCurrentProfile() async {
    http.Response response =
        await requestGetProfile(connectionHeaderApi, urlController);
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(currentProfile(response));
  }

  @override
  Future<Either<Failure, int>> getCurrentProfileID() async {
    http.Response response = await requestProfileGetName();
    if (response.statusCode != StatusCode.OK) {
      return Left(ServerFailure());
    }
    return Right(currentID(response));
  }

  // Functions for getCurrentProfile
  Future<http.Response> requestGetProfile(
      ConnectionHeaderApi connection, Uri uri) async {
    return await connectionHeaderApi.getHeader(urlController);
  }

  List<UserEntity> currentProfile(http.Response response) {
    Map<String, dynamic> map = json.decode(response.body);
    final List<UserEntity> listUsers = <UserEntity>[];
    UserEntity user = UserModel.fromJson(map);
    listUsers.add(user);
    return listUsers;
  }

  // Functions for getCurrentProfileID
  Future<http.Response> requestProfileGetName() async {
    final Uri getIdUrl = Uri.parse(AppConstants.USER_GET_NAME);
    return await connectionHeaderApi.getHeader(getIdUrl);
  }

  int currentID(http.Response response) {
    Map<String, dynamic> map = json.decode(response.body);
    return map["id"];
  }
}
