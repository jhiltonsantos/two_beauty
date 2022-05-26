import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/login_get_token_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_login_repository.dart';

@injectable
class PostLoginUsecase extends UseCase<bool, LoginGetTokenEntity> {
  final ILoginRepository _iLoginRepository;

  PostLoginUsecase(this._iLoginRepository);

  @override
  Future<Either<Failure, bool>> execute(LoginGetTokenEntity params) async {
    return await _iLoginRepository.postLogin(params);
  }
}
