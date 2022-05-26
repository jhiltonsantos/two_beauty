// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class ISignUpRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, bool>> postNewUser(UserEntity modelClass);
}
