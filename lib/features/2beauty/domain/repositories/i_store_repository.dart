import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IStoreRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<dynamic>> getData(id);

  Future<List<dynamic>> getAllData();

  Future<dynamic> postData(dynamic modelClass);
}
