import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';

@injectable
class PostLoginUsecase extends UseCase<UserAccessEntity, LoginGetTokenEntity> {
  final LoginRepository loginRepository;

  PostLoginUsecase(this.loginRepository);

  @override
  Future<Either<Failure, UserAccessEntity>> call(
      LoginGetTokenEntity params) async {
    return await loginRepository.postLogin(params);
  }
}
