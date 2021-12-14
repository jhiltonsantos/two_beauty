import 'package:to_beauty_app/presentation/resources/connection_header.dart';

abstract class IOwnerRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<dynamic> postNewOwner(dynamic modelClass);
}
