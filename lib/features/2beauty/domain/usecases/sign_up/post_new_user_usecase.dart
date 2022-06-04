import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_access_response_entity.dart';

import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/sign_up_repository.dart';

@injectable
class PostNewUserUsecase extends UseCase<UserAccessResponseEntity, UserEntity> {
  final SignUpRepository _signUpRepository;

  PostNewUserUsecase(this._signUpRepository);

  @override
  Future<Either<Failure, UserAccessResponseEntity>> execute(UserEntity params) async {
    return await _signUpRepository.postNewUser(params);
  }
}
