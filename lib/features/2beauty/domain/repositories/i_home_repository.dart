import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class IHomeRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<String> getUserData();
}
