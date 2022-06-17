import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';

abstract class LoginLocalDataSource {
  Future<bool> addLoginDataOnDB(LoginGetTokenEntity loginGetTokenEntity);

  Future<List<LoginGetTokenEntity>> getLoginDataFromDB();

  Future<bool> removeLoginDataFromDB();
}

