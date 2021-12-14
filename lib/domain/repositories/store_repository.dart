import 'package:to_beauty_app/presentation/resources/connection_header.dart';

abstract class IStoreRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<dynamic>> getData(id);
  Future<List<dynamic>> getAllData();
  Future<dynamic> postData(dynamic modelClass);
}
