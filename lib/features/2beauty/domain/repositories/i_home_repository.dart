import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IHomeRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, String>> getUserData();
}
