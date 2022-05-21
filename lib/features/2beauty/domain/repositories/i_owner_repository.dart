import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IOwnerRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<dynamic> postNewOwner(dynamic modelClass);
}
