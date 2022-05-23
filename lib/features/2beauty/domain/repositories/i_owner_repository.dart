import 'package:two_beauty/features/2beauty/domain/entities/owner_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IOwnerRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<OwnerEntity> postNewOwner(dynamic modelClass);
}
