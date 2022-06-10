import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/error/failures.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/service_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_get_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_service_repository.dart';

@injectable
class GetAllServiceDataUsecase
    extends UseCase<List<ServiceGetEntity>, NoParams> {
  final IServiceRepository _iServiceRepository = ServiceRepository();

  @override
  Future<Either<Failure, List<ServiceGetEntity>>> call(NoParams params) async {
    return await _iServiceRepository.getAllServiceData();
  }
}
