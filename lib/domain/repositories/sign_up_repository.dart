import 'package:two_beauty/presentation/resources/connection_header.dart';

abstract class ISignUpRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<dynamic> postNewUser(dynamic modelClass);
}
