import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

abstract class StoreRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, StoreGetEntity>> getStoreData(String id);

  Future<Either<Failure, List<StoreGetEntity>>> getAllStoreData();

  Future<Either<Failure, StoreEntity>> postStoreData(StoreEntity storeEntity);
}
