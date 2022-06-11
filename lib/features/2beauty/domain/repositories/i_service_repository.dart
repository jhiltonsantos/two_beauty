import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_get_entity.dart';
import 'package:two_beauty/core/constants/connection_header.dart';

abstract class IServiceRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, List<ServiceGetEntity>>> getServiceData(String id);

  Future<Either<Failure, List<ServiceGetEntity>>> getAllServiceData();

  Future<Either<Failure, ServiceEntity>> postServiceData(
      ServiceEntity serviceEntity);
}
