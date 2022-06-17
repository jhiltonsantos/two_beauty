import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';

@injectable
class GetLoginUsecase extends UseCase<LoginGetTokenEntity, NoParams> {
  final LoginRepository loginRepository;

  GetLoginUsecase(this.loginRepository);

  @override
  Future<Either<Failure, LoginGetTokenEntity>> call(NoParams params) async {
    return await loginRepository.getLogin();
  }
}
