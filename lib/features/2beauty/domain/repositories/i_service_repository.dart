import 'package:two_beauty/features/2beauty/domain/entities/service_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/service_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IServiceRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<ServiceGetEntity>> getServiceData(id);

  Future<List<ServiceGetEntity>> getAllServiceData();

  Future<ServiceEntity> postServiceData(dynamic modelClass);
}
