import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/auth/data/repositories/sign_up_repository.dart';
import 'package:two_beauty/features/auth/domain/repositories/I_sign_up_repository.dart';

@injectable
class PostNewUserUsecase extends UseCase<bool, NoParams> {
  final ISignUpRepository _iSignUpRepository = SignUpRepository();

  @override
  Future<bool> execute(NoParams params) async {
    return _iSignUpRepository.postNewUser(params);
  }
}
