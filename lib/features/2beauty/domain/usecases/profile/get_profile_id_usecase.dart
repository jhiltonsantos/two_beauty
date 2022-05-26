import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/profile_repository.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_profile_repository.dart';

@injectable
class GetProfileIdUsecase extends UseCase<int, NoParams> {
  final IProfileRepository _iProfileRepository = ProfileRepository();

  @override
  Future<Either<Failure, int>> execute(NoParams params) async {
    return await _iProfileRepository.getProfileId();
  }
}
