import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/login_repository.dart';

@injectable
class LogoutUserUsecase extends UseCase<bool, NoParams> {
  final LoginRepository _loginRepository;

  LogoutUserUsecase(this._loginRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    late bool isSuccess;
    await _loginRepository.logoutUser().then((value) {
      isSuccess = value;
    });
    if (!isSuccess) {
      return Left(CacheFailure());
    }
    return Right(isSuccess);
  }
}
