import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class ILoginRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<Either<Failure, bool>> postLogin(
      LoginGetTokenEntity loginGetTokenEntity);
}
