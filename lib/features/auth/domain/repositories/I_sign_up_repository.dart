// ignore_for_file: file_names

import 'package:two_beauty/features/2beauty/presentation/resources/connection_header.dart';

abstract class ISignUpRepository {
  late Uri urlController;
  late ConnectionHeaderApi connectionHeaderApi;

  Future<dynamic> postNewUser(dynamic modelClass);
}
