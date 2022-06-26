import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/owner_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/owner_repository.dart';

@injectable
class GetOwnerDataUsecase extends UseCase<OwnerGetEntity, NoParams> {
  final OwnerRepository _ownerRepository;

  GetOwnerDataUsecase(this._ownerRepository);

  @override
  Future<Either<Failure, OwnerGetEntity>> call(NoParams params) async {
    return await _ownerRepository.getOwnerData();
  }

}