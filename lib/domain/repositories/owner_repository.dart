import 'package:two_beauty/presentation/resources/connection_header.dart';

abstract class IOwnerRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<dynamic> postNewOwner(dynamic modelClass);
}
