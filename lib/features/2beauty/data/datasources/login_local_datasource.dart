import 'package:dartz/dartz.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';

abstract class LoginLocalDataSource {
  Future<bool> isLoginDataOnDB(LoginGetTokenEntity loginGetTokenEntity);

  Future<Either<bool, LoginGetTokenEntity>> getLoginDataFromDB();

  Future<bool> removeLoginDataFromDB();
}
