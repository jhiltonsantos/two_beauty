import 'package:to_beauty_app/presentation/resources/connection_header.dart';

abstract class ISignUpRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<dynamic> postNewUser(dynamic modelClass);
}
