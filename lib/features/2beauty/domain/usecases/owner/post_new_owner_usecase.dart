import 'package:two_beauty/features/2beauty/data/repositories/owner_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_owner_repository.dart';

class PostNewOwnerUsecase {
  final IOwnerRepository _iOwnerRepository = OwnerRepository();

  Future<OwnerEntity> execute(dynamic modelClass) {
    return _iOwnerRepository.postNewOwner(modelClass);
  }
}
