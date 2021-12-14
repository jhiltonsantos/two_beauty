import 'package:to_beauty_app/presentation/resources/connection_header.dart';

abstract class ILoginRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<dynamic> postLogin(dynamic modelClass);
}
