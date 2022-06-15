import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/core/constants/connection_header.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';

abstract class SignUpRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, UserAccessEntity>> postNewUser(UserEntity modelClass);
}
