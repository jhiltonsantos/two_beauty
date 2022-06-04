import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_response_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class SignUpRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, UserAccessResponseEntity>> postNewUser(UserEntity modelClass);
}
