// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:dartz/dartz.dart';
import "package:http/http.dart" as http;
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/connection/web_client.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_response_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/sign_up_repository.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/strings_manager.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImp implements SignUpRepository {
  @override
  Uri urlController = Uri.parse(AppConstants.USER_CREATE);

  @override
  ConnectionHeaderApi connectionHeaderApi = ConnectionHeaderApi();

  @override
  Future<Either<Failure, UserAccessResponseEntity>> postNewUser(UserEntity userEntity) async {
    Map data = {
      'username': userEntity.username,
      'email': userEntity.email,
      'first_name': userEntity.firstName,
      'password': userEntity.password
    };

     final http.Response response = await client.post(
      urlController,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      UserAccessResponseEntity newUserData = UserAccessResponseEntity.fromJson(json.decode(response.body));
      return Right(newUserData);
    } else {
      return Left(ServerFailure());
    }
  }
}
