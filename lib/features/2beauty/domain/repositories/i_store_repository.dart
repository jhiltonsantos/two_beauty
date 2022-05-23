import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IStoreRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<dynamic>> getStoreData(id);

  Future<List<dynamic>> getAllStoreData();

  Future<dynamic> postStoreData(dynamic modelClass);
}
