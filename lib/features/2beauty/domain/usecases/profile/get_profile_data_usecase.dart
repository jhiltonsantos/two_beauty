import 'package:two_beauty/features/2beauty/data/repositories/profile_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/user_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_profile_repository.dart';

class GetProfileDataUsecase {
  final IProfileRepository _iProfileRepository = ProfileRepository();

  Future<List<UserEntity>> execute() {
    return _iProfileRepository.getProfileData();
  }
}
