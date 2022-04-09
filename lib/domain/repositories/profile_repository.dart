import 'package:two_beauty/presentation/resources/connection_header.dart';

abstract class IProfileRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<dynamic>> getData(id);
}
