import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/profile_repository.dart';

@injectable
class GetCurrentProfileUsecase extends UseCase<List<UserEntity>, NoParams> {
  final ProfileRepository _profileRepository;

  GetCurrentProfileUsecase(this._profileRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async{
    return await _profileRepository.getCurrentProfile();
  }

}
