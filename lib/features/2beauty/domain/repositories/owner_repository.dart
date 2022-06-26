import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/core/constants/connection_header.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_get_entity.dart';

abstract class OwnerRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, OwnerEntity>> postNewOwner(OwnerEntity ownerEntity);
  Future<Either<Failure, OwnerGetEntity>> getOwnerData();
}
