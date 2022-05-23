import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/auth/data/repositories/login_repository.dart';
import 'package:two_beauty/features/auth/domain/repositories/i_login_repository.dart';

@injectable
class PostLoginUsecase extends UseCase<bool, NoParams> {
  final ILoginRepository _iLoginRepository = LoginRepository();

  @override
  Future<bool> execute(NoParams params) async {
    return await _iLoginRepository.postLogin(params);
  }
}
