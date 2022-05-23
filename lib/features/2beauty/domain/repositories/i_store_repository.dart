import 'package:two_beauty/features/2beauty/domain/entities/store_entity.dart';
import 'package:two_beauty/features/2beauty/domain/entities/store_get_entity.dart';
import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IStoreRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<StoreGetEntity>> getStoreData(id);

  Future<List<StoreGetEntity>> getAllStoreData();

  Future<StoreEntity> postStoreData(dynamic modelClass);
}
