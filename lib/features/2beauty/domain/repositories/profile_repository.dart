import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

abstract class ProfileRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, List<UserEntity>>> getCurrentProfile();

  Future<Either<Failure, int>> getCurrentProfileID();
}
