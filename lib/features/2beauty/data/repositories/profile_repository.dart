// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_profile_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@injectable
class ProfileRepository implements IProfileRepository {
  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Uri urlController = Uri.parse(AppConstants.PROFILE_GET);

  @override
  Future<Either<Failure, List<UserEntity>>> getProfileData() async {
    http.Response response =
        await connectionHeaderApi.getResponse(urlController);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);
      final listUsers = <UserEntity>[];
      UserEntity user = UserEntity.fromJson(map);
      listUsers.add(user);
      return Right(listUsers);
    } else {
      // throw Exception('Falha ao carregar usuario');
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, int>> getProfileId() async {
    final Uri getIdUrl = Uri.parse(AppConstants.USER_GET_NAME);
    http.Response response = await connectionHeaderApi.getResponse(getIdUrl);

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      int data = mapResponse["id"];
      return Right(data);
    } else {
      // throw Exception('Falha ao carregar usuarios');
      return Left(ServerFailure());
    }
  }
}
