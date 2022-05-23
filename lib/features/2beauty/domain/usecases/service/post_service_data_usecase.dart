import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/usecase/usecase.dart';
import 'package:two_beauty/features/2beauty/data/repositories/service_repository.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_entity.dart';
import 'package:two_beauty/features/2beauty/domain/repositories/i_service_repository.dart';

@injectable
class PostServiceDataUsecase extends UseCase<ServiceEntity, NoParams> {
  final IServiceRepository _iServiceRepository = ServiceRepository();

  @override
  Future<ServiceEntity> execute(NoParams params) async {
    return await _iServiceRepository.postServiceData(params);
  }
}
