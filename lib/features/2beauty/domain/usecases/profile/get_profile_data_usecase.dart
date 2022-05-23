import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/profile_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_profile_repository.dart';

@injectable
class GetProfileDataUsecase extends UseCase<List<UserEntity>, NoParams> {
  final IProfileRepository _iProfileRepository = ProfileRepository();

  @override
  Future<List<UserEntity>> execute(NoParams params) async {
    return await _iProfileRepository.getProfileData();
  }
}
