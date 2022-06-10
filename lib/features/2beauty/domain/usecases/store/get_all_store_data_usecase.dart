import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/store_repository.dart';

@injectable
class GetAllStoreDataUsecase extends UseCase<List<StoreGetEntity>, NoParams> {
  final StoreRepository _storeRepository;

  GetAllStoreDataUsecase(this._storeRepository);

  @override
  Future<Either<Failure, List<StoreGetEntity>>> call(NoParams params) async {
    return await _storeRepository.getAllStoreData();
  }
}
