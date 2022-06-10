import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/profile_repository.dart';

@injectable
class GetCurrentProfileID extends UseCase<int, NoParams> {
  final ProfileRepository _profileRepository;

  GetCurrentProfileID(this._profileRepository);

  @override
  Future<Either<Failure, int>> call(NoParams params) async {
    return await _profileRepository.getCurrentProfileID();
  }
}
