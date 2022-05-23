import 'package:two_beauty/features/2beauty/data/repositories/profile_repository.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_profile_repository.dart';

class GetProfileIdUsecase {
  final IProfileRepository _iProfileRepository = ProfileRepository();

  Future<int> execute() {
    return _iProfileRepository.getProfileId();
  }
}
