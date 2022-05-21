import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IServiceRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<dynamic>> getServiceData(id);

  Future<List<dynamic>> getAllServiceData();

  Future<dynamic> postServiceData(dynamic modelClass);
}
