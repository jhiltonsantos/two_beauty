import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/store_repository.dart';

@injectable
class PostStoreDataUsecase extends UseCase<StoreEntity, StoreEntity> {
  final StoreRepository _storeRepository;

  PostStoreDataUsecase(this._storeRepository);

  @override
  Future<Either<Failure, StoreEntity>> call(StoreEntity params) async {
    return await _storeRepository.postStoreData(params);
  }
}
