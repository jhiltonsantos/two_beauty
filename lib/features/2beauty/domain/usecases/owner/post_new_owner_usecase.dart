import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/owner_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_owner_repository.dart';

@injectable
class PostNewOwnerUsecase extends UseCase<OwnerEntity, NoParams> {
  final IOwnerRepository _iOwnerRepository = OwnerRepository();

  @override
  Future<OwnerEntity> execute(NoParams params) async {
    return await _iOwnerRepository.postNewOwner(params);
  }
}
