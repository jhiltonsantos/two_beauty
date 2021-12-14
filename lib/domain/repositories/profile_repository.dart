import 'package:to_beauty_app/presentation/resources/connection_header.dart';

abstract class IProfileRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<List<dynamic>> getData(id);
}
