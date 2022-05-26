import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';

import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/I_sign_up_repository.dart';

@injectable
class PostNewUserUsecase extends UseCase<bool, UserEntity> {
  final ISignUpRepository _iSignUpRepository;

  PostNewUserUsecase(this._iSignUpRepository);

  @override
  Future<Either<Failure, bool>> execute(UserEntity params) async {
    return await _iSignUpRepository.postNewUser(params);
  }
}
