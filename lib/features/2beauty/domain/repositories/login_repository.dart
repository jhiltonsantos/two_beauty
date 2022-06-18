import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

abstract class LoginRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, UserAccessEntity>> postLogin(
      LoginGetTokenEntity loginGetTokenEntity);

  Future<Either<Failure, LoginGetTokenEntity>> getLogin();

  Future<bool> logoutUser();
}
